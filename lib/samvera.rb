# frozen_string_literal: true

module Samvera
  def self.relative_file_path
    File.dirname(__FILE__)
  end

  def self.absolute_file_path
    File.absolute_path(relative_file_path)
  end

  def self.root_path
    Pathname.new(absolute_file_path)
  end

  autoload(:GemQueryService, root_path.join('samvera', 'gem_query_service'))
  autoload(:RubyGems, root_path.join('samvera', 'ruby_gems'))
  autoload(:RepositoryQueryService, root_path.join('samvera', 'repository_query_service'))
  autoload(:GitHub, root_path.join('samvera', 'git_hub'))
  autoload(:Org, root_path.join('samvera', 'org'))
end
