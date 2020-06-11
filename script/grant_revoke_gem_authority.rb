# frozen_string_literal: true

# The purpose of this script is to manage the authors of the rubygems
# managed by the Samvera community.
#
# 1. Get a personal access token from GitHub (https://github.com/settings/tokens)
#    with the following scopes enabled:
#    * public_repo
#    * read:org
#    * user:email
# 2. Set an ENV variable named 'GITHUB_SAMVERA_TOKEN' containing your token
# 3. Then run this script:
#    $ bundle exec ruby ./script/grant_revoke_gem_authority.rb
#
# By default the above script will iterate over samvera and
# samvera-labs repositories. If you set the WITH_DEPRECATED
# environment variable, then the script will include
# samvera-deprecated organization.
#
# To also revoke ownership from users whose email addresses are not in the list:
#
# $ WITH_REVOKE=true bundle exec ruby ./script/grant_revoke_gem_authority.rb
#
# To print more information on what the script is doing:
#
# $ VERBOSE=true ruby ./script/grant_revoke_gem_authority.rb

require 'github_api'
require 'open3'

AUTHORIZATION_TOKEN = ENV['GITHUB_SAMVERA_TOKEN'] || raise("GitHub authorization token was not found in the GITHUB_SAMVERA_TOKEN environment variable")

if ENV.fetch("WITH_DEPRECATED", false)
  ORGANIZATION_NAMES = ['samvera', 'samvera-labs', 'samvera-deprecated']
else
  ORGANIZATION_NAMES = ['samvera', 'samvera-labs']
end

# Some GitHub repositories are named differently from their gems. We
# could read each repositories .gemspec to determine its
# name. However, this is a far quicker short-cut.
KNOWN_MISMATCHED_GEM_NAMES = {
  'active_fedora' => 'active-fedora',
  'fcrepo-admin' => 'fcrepo_admin',
  'questioning_authority' => 'qa'
}

# GitHub repositories with matching gems that aren't from Samvera
FALSE_POSITIVES = [
  'hypatia',
  'rdf-vocab',
  'lerna',
  'hydrangea'
]

# Gems that do not have their own GitHub repositories
HANGERS_ON = [
  'hydra-core',
  'hydra-access-controls',
  'sufia-models',
  'curation_concerns-models'
]

VERBOSE = ENV.fetch('VERBOSE', false)

# See https://guides.rubygems.org/rubygems-org-api/#rate-limits I'm
# opting for the slower 0.2 so as to not come close to the rate limit.
GEM_SLEEP_INTERVAL = 0.2

$stdout.puts "Hang in there! This script takes a couple minutes to run."

github = Github.new(oauth_token: AUTHORIZATION_TOKEN, auto_pagination: true)

# Keep track of things
@errors = []
@bogus_gem_names = []
@gem_names = HANGERS_ON

@definitive_committers = File.read(
  File.expand_path("../../data/definitive-rubygems-authors-list.txt", __FILE__)
).split("\n").map { |line| line.sub(/ *#.*$/, "") }.select { |line| !line.empty? }

ORGANIZATION_NAMES.each do |org_name|
  github.repos.list(org: org_name).each do |repo|
    # Replace known mismatched names
    name = KNOWN_MISMATCHED_GEM_NAMES.fetch(repo.name, repo.name)

    # Let's move on to any gem that we know will be a false positive.
    next if FALSE_POSITIVES.include?(name)

    # TODO: We are twice calling `gem owner` for information. We could
    # rework the logic to only call it once.
    sleep(GEM_SLEEP_INTERVAL)
    if system("gem owner #{name} > /dev/null 2>&1")
      @gem_names << name
    else
      @bogus_gem_names << repo.full_name
    end
  end
end

OWNERSHIP_ACTIONS = {
  add: '-a',
  remove: '-r'
}

# @param gemname [String]
# @param profile [String] either an email associated with Rubygems or the
#                         Rubygems.org profile name
# @param action [Symbol] either :add or :remove (see OWNERSHIP_ACTIONS)
def modify_gem_ownership(gemname:, profile:, action:)
  switch = OWNERSHIP_ACTIONS.fetch(action)
  sleep(GEM_SLEEP_INTERVAL)
  command = "gem owner #{gemname} #{switch} #{profile}"
  $stdout.puts "running: #{command}" if VERBOSE
  Open3.popen3(command) do |stdin, stdout, stderr, wait_thr|
    @errors << "#{command}: #{stdout.read.chomp}" unless wait_thr.value.success?
  end
end


@gem_names.sort.each do |gemname|
  $stdout.puts "Updating #{gemname}..."

  sleep(GEM_SLEEP_INTERVAL)
  current_committers = `gem owner #{gemname} | grep -e ^-`.split("\n")
  current_committers.collect! { |cc| cc.sub(/^.\s+/,'')}

  committers_to_add = @definitive_committers - current_committers
  committers_to_add.each do |profile|
    modify_gem_ownership(gemname: gemname, profile: profile, action: :add)
  end

  if ENV.fetch('WITH_REVOKE', false)
    committers_to_remove = current_committers - committer_emails
    committers_to_remove.each do |profile|
      modify_gem_ownership(gemname: gemname, profile: profile, action: :remove)
    end
  end
end

if @bogus_gem_names.any?
  $stderr.puts("WARNING: These Samvera repositories do not have gems:\n - #{@bogus_gem_names.sort.join("\n - ")}")
  $stderr.puts("\n")
end

if @errors.any?
  $stderr.puts("The following errors were encountered:")
  $stderr.puts(%(#{@errors.sort.join("\n")}))
end
