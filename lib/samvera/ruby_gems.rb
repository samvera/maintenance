# frozen_string_literal: true

require 'github_api'
require 'rubygems/commands/owner_command'
require 'rubygems/commands/search_command'

module Samvera
  class RubyGems
    class << self
      def show_gem_owners(name:)
        gem_name = GemQueryService.find_gem_name(repository_name: name)
        query_service = GemQueryService.new(gem_name: gem_name)

        query_service.find_owners
      end

      def add_gem_owners(name:, owners:)
        gem_name = GemQueryService.find_gem_name(repository_name: name)
        query_service = GemQueryService.new(gem_name: gem_name)

        query_service.add(owners: owners)
      end

      def remove_gem_owners(name:, owners:)
        gem_name = GemQueryService.find_gem_name(repository_name: name)
        query_service = GemQueryService.new(gem_name: gem_name)

        query_service.remove(owners: owners)
      end

      def gem_exists?(name:)
        GemQueryService.exists?(name: name)
      end
    end
  end
end
