# frozen_string_literal: true

require 'github_api'

module Samvera
  class GitHub
    class << self
      def authorization_token
        @authorization_token = ENV.fetch('GITHUB_SAMVERA_TOKEN', nil) || raise(
          ArgumentError,
          'GitHub authorization token was not found in the GITHUB_SAMVERA_TOKEN environment variable'
        )
      end

      def orgs
        @orgs = github.orgs
      end

      def teams
        @teams = orgs.teams
      end

      def users
        @users = github.users(auto_pagination: true)
      end

      def samvera_repositories
        @samvera_repositories = begin
          response = github.repos(user: 'samvera')
          resolved = response.all.to_a
          resolved.reject { |r| RepositoryQueryService.invalid_repositories.include?(r.name) }
        end
      end

      def labs_repositories
        @labs_repositories = begin
          response = github.repos(user: 'samvera-labs')
          resolved = response.all.to_a
          resolved.reject { |r| RepositoryQueryService.invalid_repositories.include?(r.name) }
        end
      end

      def repositories
        @repositories = samvera_repositories + labs_repositories
      end

      def samvera_team
        @samvera_team = teams.list(org: 'samvera', auto_pagination: true)
      end

      def admin_team
        @admin_team = samvera_team.find { |team| team.name == 'admins' }
      end

      def admin_response
        @admin_response = teams.list_members(admin_team.id)
      end

      def samvera_admins
        @samvera_admins ||= begin
          admin_owners = admin_response.map do |u|
            resolved = users.get(user: u.login)
            GemQueryService::Owner.new(id: nil, handle: resolved.login)
          end

          admin_owners.reject do |o|
            samvera_contributors.map(&:login).include?(o.login) || GemQueryService::Owner.invalid_owners.include?(o.login)
          end
        end
      end

      def contrib_team
        @contrib_team = samvera_team.find { |team| team.name == 'contributors' }
      end

      def contrib_response
        @contrib_response = teams.list_members(contrib_team.id)
      end

      def samvera_contributors
        @samvera_contributors ||= begin
          contrib_owners = contrib_response.map do |u|
            resolved = users.get(user: u.login)
            GemQueryService::Owner.new(id: nil, handle: resolved.login)
          end
          contrib_owners.reject do |o|
            GemQueryService::Owner.invalid_owners.include?(o.login)
          end
        end
      end

      def github
        # @github ||= ::Github.new(oauth_token: authorization_token, auto_pagination: true)
        @github = ::Github.new(oauth_token: authorization_token, auto_pagination: true)
      end
    end
  end
end
