# frozen_string_literal: true

require 'rubygems/commands/owner_command'
require 'rubygems/commands/search_command'

module Samvera
  class GemQueryService
    class ShowOwnersCommand < ::Gem::Commands::OwnerCommand
      def show_owners(name)
        ::Gem.load_yaml

        sleep(1.1)
        response = rubygems_api_request :get, "api/v1/gems/#{name}/owners.yaml" do |request|
          request.add_field 'Authorization', api_key
        end

        owners = []
        with_response response do |resp|
          cleaned = clean_text(resp.body)
          owners = ::Gem::SafeYAML.load(cleaned)
        end
        owners
      end

      def execute
        @host = options[:host]

        sign_in(scope: nil)
        name = get_one_gem_name
        show_owners(name)
      end
    end

    class ManageOwnersCommand < ShowOwnersCommand
      def with_response(response, error_prefix = nil)
        case response
        when Net::HTTPSuccess
          clean_text(response.body)
        else
          message = response.body
          message = "#{error_prefix}: #{message}" if error_prefix
          cleaned = clean_text(message)
          raise(StandardError, cleaned)
        end
      end

      def manage_owners(method, name, owners)
        owners.each do |owner|
          sleep(1.1)
          response = send_owner_request(method, name, owner)
          action = method == :delete ? 'Removing' : 'Adding'

          say("#{action} the Gem owner #{owner} for #{name}...")
          with_response response, "Error raised while #{action.downcase} the Gem owner #{owner} for #{name}"
        end
      end
    end

    class AddOwnersCommand < ManageOwnersCommand
      def execute
        @host = options[:host]

        sign_in(scope: :add_owner)
        name = get_one_gem_name
        owners = options[:add]
        add_owners(name, owners)
      end
    end

    class RemoveOwnersCommand < ManageOwnersCommand
      def execute
        @host = options[:host]

        sign_in(scope: :add_owner)
        name = get_one_gem_name
        owners = options[:remove]
        remove_owners(name, owners)
      end
    end

    class ShowGemsCommand < ::Gem::Commands::SearchCommand
      def show_remote_gems(name)
        fetcher = ::Gem::SpecFetcher.fetcher
        sleep(1.1)

        fetcher.detect(specs_type) do |name_tuple|
          # rubocop: disable Style/CaseEquality
          name === name_tuple.name
          # rubocop: enable Style/CaseEquality
        end
      end

      # @return [Array<Gem::NameTuple>]
      def execute
        gem_names = Array(options[:name])

        gem_names.map do |n|
          values = show_gems(n)
          values.flatten
        end
      end
    end

    def self.find_gem_name(repository_name:)
      Gem.find_name(repository_name)
    end

    def self.find(name:)
      search_command = ShowGemsCommand.new
      gem_name = find_gem_name(repository_name: name)
      name_option = /^#{gem_name}$/

      search_command.options[:name] = name_option
      search_command.options[:domain] = :remote
      results = search_command.execute
      results.flatten
    end

    def self.exists?(name:)
      results = find(name: name)
      !results.empty?
    end

    class Gem
      def self.root_path
        @root_path ||= begin
          relative_file_path = File.dirname(__FILE__)
          absolute_file_path = File.absolute_path(relative_file_path)
          Pathname.new(absolute_file_path)
        end
      end

      def self.config_file_path
        root_path.join('..', '..', 'config', 'github.yaml')
      end

      def self.config
        content = File.read(config_file_path)
        loaded = YAML.safe_load(content)
        loaded.symbolize_keys
      end

      def self.rubygems_config
        loaded = config[:rubygems]
        loaded.symbolize_keys
      end

      def self.config_gems
        rubygems_config[:gems]
      end

      def self.find_name(value)
        return value unless config_gems.key?(value)

        config_gems[value]
      end
    end

    class Owner
      def self.root_path
        @root_path ||= begin
          relative_file_path = File.dirname(__FILE__)
          absolute_file_path = File.absolute_path(relative_file_path)
          Pathname.new(absolute_file_path)
        end
      end

      def self.config_file_path
        root_path.join('..', '..', 'config', 'rubygems.yaml')
      end

      def self.config
        content = File.read(config_file_path)
        loaded = YAML.safe_load(content)
        loaded.symbolize_keys
      end

      def self.github_config
        loaded = config[:github]
        loaded.symbolize_keys
      end

      def self.config_owners
        github_config[:owners]
      end

      def self.find_login(handle:)
        return handle unless config_owners.key?(handle)

        config_owners[handle]
      end

      def self.owners_config
        loaded = config[:owners]
        loaded.symbolize_keys
      end

      def self.invalid_owners
        owners_config[:invalid]
      end

      def initialize(id:, handle:)
        @id = id
        @handle = handle
      end

      def login
        self.class.find_login(handle: @handle)
      end
    end

    # Constructor
    # @param gem_name
    def initialize(gem_name:)
      @gem_name = gem_name
    end

    def find_owners
      owner_command = ShowOwnersCommand.new
      owner_command.options[:args] = [@gem_name]

      results = owner_command.execute
      results.map { |r| Owner.new(**r.symbolize_keys) }
    end

    def add(owners:)
      add_command = AddOwnersCommand.new
      add_command.options[:args] = [@gem_name]
      owner_logins = owners.map(&:login)
      add_command.options[:add] = owner_logins

      add_command.execute
    end

    def remove(owners:)
      add_command = RemoveOwnersCommand.new
      add_command.options[:args] = [@gem_name]
      owner_logins = owners.map(&:login)
      add_command.options[:add] = []
      add_command.options[:remove] = owner_logins

      add_command.execute
    end
  end
end
