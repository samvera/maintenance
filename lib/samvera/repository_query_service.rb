# frozen_string_literal: true

module Samvera
  class RepositoryQueryService
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

    def self.repository_config
      loaded = config[:repositories]
      loaded.symbolize_keys
    end

    def self.invalid_repositories
      repository_config[:invalid]
    end
  end
end
