require 'open3'
require 'psych'

# NOTE: I have tried to use change directory into a specific path
# (e.g., `cd`). However, as implemented, Bundler sees my antics and
# does not allow it to work. I am certain if I step out of CLI and use
# a bundler tool, this can work. For now, you'll want to copy this
# script to the directory in which you want to run it.

# Read through the current directories list of bundled gems. Capture
# each gem's specification. Sort the specifications by version release
# date, and print one line per gem. Note, this takes some time to run.
#
# Example:
#
#   2020-06-11  1.40.0  rubocop-rspec
#   2020-06-11  1.329.0 aws-partitions
#   2020-06-12  3.99.2  aws-sdk-core
#   2020-06-12  1.0.1   ldp

specifications = []

BUNDLE_LIST_REGEXP = %r{^\* +(?<gem_name>[^ ]+) \((?<gem_version>[^\)]+)\)}

# I want to see, according to bundler, the gem name and bundle
# version.
Open3.popen3("bundle list") do |i,o,e,w|
  o.read.chomp.split("\n").each do |line|
    line.strip!
    match = BUNDLE_LIST_REGEXP.match(line)
    next unless match
    # gem and bundler operate in different spaces. If you have
    # instaled a later version than what is bundle, gem will pick up
    # that later version.
    Open3.popen3("gem specification #{match[:gem_name]} --version #{match[:gem_version]}") do |stdin, stdout, stderr, wait_thr|
      next unless wait_thr.value.success?
      yaml  = stdout.read.chomp
      specifications << Psych.load(yaml)
    end
  end
end

puts "DATE\tVERSION\tGEM_NAME"
specifications.sort {|a, b| a.date <=> b.date }.each do |spec|
  puts "#{spec.date.strftime('%Y-%m-%d')}\t#{spec.version}\t#{spec.name}"
end
