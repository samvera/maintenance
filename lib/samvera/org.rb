# frozen_string_literal: true

require 'thor'

module Samvera
  class Org < Thor
    desc('admins', 'list members of the GitHub administrative Team')
    def admins
      GitHub.samvera_admins.each do |u|
        say("#{u.login}\n", :green)
      end
    end

    desc('contributors', 'list members of the GitHub administrative Team')
    def contributors
      GitHub.samvera_contributors.each do |u|
        say("#{u.login}\n", :green)
      end
    end

    desc('repositories', 'list Samvera repositories')
    def repositories
      GitHub.repositories.each do |repo|
        say("#{repo.name}: #{repo.html_url}", :green)
      end
    end

    desc('add_owners', 'Ensure that all members of the administrator GitHub Team are Gem Owners for RubyGems entries')
    def add_owners
      GitHub.repositories.each do |repo|
        if RubyGems.gem_exists?(name: repo.name)
          current_owners = RubyGems.show_gem_owners(name: repo.name)
          owners = GitHub.samvera_admins.reject { |o| current_owners.map(&:login).include?(o.login) }

          say("Adding the Gem owners for #{repo.name}...", :green)
          begin
            RubyGems.add_gem_owners(name: repo.name, owners: owners)
          rescue StandardError => e
            raise(Thor::Error, e.message)
          end
        else
          say("Could not find the Gem for #{repo.name}...", :red)
        end
      end
    end

    desc('remove_owners',
         'Ensure that all Gem Owners for RubyGems entries which are *not* members of the administrator GitHub Team are removed')
    def remove_owners
      GitHub.repositories.each do |repo|
        if RubyGems.gem_exists?(name: repo.name)
          current_owners = RubyGems.show_gem_owners(name: repo.name)
          owners = GitHub.samvera_admins.reject { |o| current_owners.map(&:login).include?(o.login) }

          say("Removing the Gem owners for #{repo.name}...", :green)
          begin
            RubyGems.remove_gem_owners(name: repo.name, owners: owners)
          rescue StandardError => e
            raise(Thor::Error, e.message)
          end
        else
          say("Could not find the Gem for #{repo.name}...", :red)
        end
      end
    end
  end
end
