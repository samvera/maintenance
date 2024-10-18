#!/usr/bin/env ruby

require 'octokit'
require 'thor'
require 'yaml'
require 'faraday'
require 'json'

class Samvera < Thor

  attr_reader :owner, :repo, :label, :project_id

  desc "audit_issues", "Audits a repository for all stale issues, labels them, and adds a comment to the issue."
  option :repo, required: true, type: :string
  option :updated, type: :string, default: "2021-01-01"
  option :created, type: :string, default: "2021-01-01"
  option :label, type: :string, default: "stale"
  option :project_id, type: :numeric, default: 28
  def audit_issues

    @repo = options[:repo]
    created = options[:created]
    updated = options[:updated]
    @label = options[:label]
    @project_id = options[:project_id]

    # Define the search criteria
    query = "repo:#{repo} is:issue is:open created:<#{created} updated:<#{updated}"

    # Perform the search for issues
    issues = client.search_issues(query)

    issues.items.each do |issue|
      say("Auditing Issue ##{issue.number}: #{issue.title}...", :green)

      issue_creator = issue.user.login
      comment_body = "@#{issue_creator} as a test for an automated maintenance task, this issue is being labeled as `stale` due to its age. Should you wish to reclassify this as a prioritized issue, please contact @samvera/maintenance for assistance. Thank you for your patience."

      # Check if the issue already has the "stale" label
      unless issue.labels.map(&:name).include?(label)
        begin
          client.add_labels_to_an_issue(repo, issue.number, [label])
          say("Label ``#{label}\" applied to Issue ##{issue.number}", :green)

          client.add_comment(repo, issue.number, comment_body)
          say("Comment added to Issue ##{issue.number}", :green)

          # Check if the issue has any assignees
          if issue.assignees.any?
            # Extract assignee logins
            assignees = issue.assignees.map(&:login)

            # Remove all assignees from the issue
            client.remove_assignees(repo, issue.number, assignees)
            say("Removed assignees from Issue ##{issue.number}: #{assignees.join(', ')}", :green)
          else
            say("No assignees to remove from Issue ##{issue.number}", :yellow)
          end

          # Check if the issue has a milestone
          if issue.milestone
            # Remove the milestone from the issue
            client.update_issue(repo, issue.number, milestone: nil)
            say("Removed milestone from Issue ##{issue.number}", :green)
          else
            say("No milestone to remove from Issue ##{issue.number}", :yellow)
          end

          # This will fail, as projects are only supported with the GraphQL API
          # @see https://docs.github.com/en/rest/projects/projects?apiVersion=2022-11-28
          # project_url = "https://github.com/orgs/samvera/projects/#{project_id}"
          # project_card = client.create_project_card(project_url, content_id: issue.id, content_type: 'Issue')
          # say("Added Issue ##{issue.number} to Project '#{project_url}'", :green)
        rescue Octokit::Error => e
          say("Failed to audit Issue ##{issue.number}: #{e.message}", :red)
        end
      else
        say("Issue ##{issue.number} already has the ``#{label}\" label", :yellow)
      end
      say("-" * 40, :green)
    end
  end

  desc "add_team_member", "Adds a GitHub user to a Samvera Organization Team"
  option :user, required: true, type: :string
  option :team, type: :string, default: "maintenance"
  option :org, type: :string, default: "samvera"
  def add_team_member

    team_slug = options[:team]
    user_login = options[:user]
    org = options[:org]

    begin
      team = client.team_by_name(org, team_slug)
      team_id = team[:id]
      client.add_team_membership(team_id, user_login)

      say("#{user_login} has been successfully added to the team #{team_slug} in the organization #{org}.", :green)
    rescue Octokit::NotFound => not_found_error
      say("The team or organization was not found, or the user does not exist: #{not_found_error}", :red)
    rescue Octokit::Unauthorized
      say("Authentication failed. Please check your personal access token.", :red)
    rescue Octokit::UnprocessableEntity
      say("The user is already a member of the team.", :yellow)
    end
  end

  desc "remove_team_member", "Remove a GitHub user from a Samvera Organization Team"
  option :user, required: true, type: :string
  option :team, required: true, type: :string
  option :org, type: :string, default: "samvera"
  def remove_team_member

    team_slug = options[:team]
    user_login = options[:user]
    org = options[:org]

    begin
      team = client.team_by_name(org, team_slug)
      team_id = team[:id]
      client.remove_team_membership(team_id, user_login)

      say("#{user_login} has been successfully removed from the team #{team_slug} in the organization #{org}.", :green)
    rescue Octokit::NotFound
      say("The team or organization was not found, or the user does not exist.", :red)
    rescue Octokit::Unauthorized
      say("Authentication failed. Please check your personal access token.", :red)
    rescue Octokit::UnprocessableEntity
      say("The user is not a member of the team.", :yellow)
    end
  end

  desc "audit_repo_ci", "Audit the continuous integration (CI) configuration for a Samvera GitHub Repository"
  option :repo, required: true, type: :string
  option :owner, type: :string, default: "samvera"
  option :label, type: :string, default: "maintenance"
  option :project_id, type: :numeric, default: 28
  def audit_repo_ci

    @owner = options[:owner]
    @repo = options[:repo]
    @label = options[:label]
    @project_id = options[:project_id]

    repo_url = "https://github.com/#{owner}/#{repo}.git"
    local_dir = "tmp/#{repo}"

    # Clone the repository if it doesn't already exist
    unless Dir.exist?(local_dir)
      say("Cloning repository...", :green)
      system("git clone #{repo_url} #{local_dir}")
    end

    file_path = File.join(local_dir, '.circleci', 'config.yml')

    if File.exist?(file_path)
      say("File exists: #{file_path}", :green)

      content = File.read(file_path)
      config = YAML.load(content)

      if config.key?("orbs")
        say("Orbs are specified", :green)

        orbs = config["orbs"]

        if orbs.key?("samvera")
          say("samvera/circleci-orb is used", :green)

          samvera_orb = orbs["samvera"]
          if samvera_orb != samvera_orb_release
            validation_error = "Unsupported release of samvera/circleci-orb is referenced"
            handle_error(validation_error: validation_error)
          else
            say("Latest supported release of samvera/circleci-orb is referenced", :green)
          end
        else
          validation_error = "samvera/circleci-orb is not used"
          handle_error(validation_error: validation_error)
        end
      else
        validation_error = "No orbs are specified"
        handle_error(validation_error: validation_error)
      end

      if config.key?("jobs")

        jobs = config["jobs"]
        checks_for_master_branch = false

        jobs.each_pair do |key, job|

          if job.key?("parameters")
            parameters = job["parameters"]

            if parameters.key?("ruby_version")
              say("Ruby version is parameterized for #{key}", :green)
            else
              validation_error = "Ruby version is not parameterized for #{key}"
              handle_error(validation_error: validation_error)
            end

            if parameters.key?("bundler_version")
              say("Bundler version is parameterized for #{key}", :green)
            else
              validation_error = "Bundler version is not parameterized for #{key}"
              handle_error(validation_error: validation_error)
            end
          else
            validation_error = "Parameters are not specified for job #{key}"
            handle_error(validation_error: validation_error)
          end

          if job.key?("steps")
            steps = job["steps"]

            if steps.empty?
              validation_error = "Steps are empty for #{key}"
              handle_error(validation_error: validation_error)
            end

            steps.each do |step|
              if step.is_a?(Hash)
                if step.key?("run")
                  command = step["run"]

                  if command.key?("name")
                    name = command["name"]

                    if name == "Check for a branch named 'master'"
                      checks_for_master_branch = true
                      say("Found a job which checks for the existence of a branch named `master`.", :green)
                    end
                  end
                end
              end
            end
          else
            validation_error = "Steps are not specified for job #{key}"
            handle_error(validation_error: validation_error)
          end
        end

        unless checks_for_master_branch
          validation_error = "No job checks for the existence of a branch named `master`."
          handle_error(validation_error: validation_error)
        end
      else
        validation_error = "No jobs are specified"
        handle_error(validation_error: validation_error)
      end

      if config.key?("workflows")

        workflows = config["workflows"]

        workflows.each_pair do |key, workflow|

          if workflow.key?("jobs")
            jobs = workflow["jobs"]

            jobs.each do |job|
              job.each_pair do |key, arg|
                if arg.key?("ruby_version")
                  ruby_version = arg["ruby_version"]

                  if supported_ruby_versions.include?(ruby_version)
                    say("Supported Ruby version #{ruby_version} is used for CircleCI", :green)
                  else
                    validation_error = "Unsupported Ruby version #{ruby_version} is used for CircleCI"
                    handle_error(validation_error: validation_error)
                  end
                end

                if arg.key?("rails_version")
                  rails_version = arg["rails_version"]

                  if supported_rails_versions.include?(rails_version)
                    say("Supported Rails version #{rails_version} is used for CircleCI", :green)
                  else
                    validation_error = "Unsupported Rails version #{rails_version} is used for CircleCI"
                    handle_error(validation_error: validation_error)
                  end
                end
              end
            end
          else
            validation_error = "No workflow jobs are specified"
            handle_error(validation_error: validation_error)
          end
        end
      else
        validation_error = "No workflows are specified"
        handle_error(validation_error: validation_error)
      end
    else
      validation_error = "File does not exist: #{file_path}"
      handle_error(validation_error: validation_error)
    end
  end

  class Gems < Thor

    attr_reader :gem, :owner

    desc "list_owners", "List owners for a given gem"
    option :gem, required: true, type: :string
    def list_owners
      @gem = options[:gem]

      response = request_owners

      if response.success?
        payload = JSON.parse(response.body)

        owners = payload
        owners.each do |owner|

          if owner.key?("handle")
            handle = owner["handle"]
            say("#{handle}", :green)
          end
        end
      else
        say("Failed to request the Gem information for #{gem}: #{response.body}", :red)
      end
    end

    desc "add_owner", "Add an owner for a given gem"
    option :gem, required: true, type: :string
    option :owner, required: true, type: :string
    def add_owner
      @gem = options[:gem]
      @owner = options[:owner]

      response = request_add_owner

      if response.success?
        say("Successfully added the new owner #{owner}", :green)
      else
        say("Failed to add the new owner #{owner}: #{response.body}", :red)
      end
    end

    desc "remove_owner", "Remove an owner for a given gem"
    option :gem, required: true, type: :string
    option :owner, required: true, type: :string
    def remove_owner
      @gem = options[:gem]
      @owner = options[:owner]

      response = request_remove_owner

      if response.success?
        say("Successfully removed the owner #{owner}", :green)
      else
        say("Failed to remove the owner #{owner}: #{response.body}", :red)
      end
    end

    private

    def request_owners
      Faraday.get("https://rubygems.org/api/v1/gems/#{gem}/owners.json")
    end

    def api_key
      ENV["RUBYGEMS_API_KEY"]
    end

    def request_add_owner
      params = {
        email: owner
      }
      encoded = JSON.generate(params)
      headers = {
        Authorization: api_key,
        "Content-Type": "application/json"
      }
      Faraday.post("https://rubygems.org/api/v1/gems/#{gem}/owners.json", encoded, headers)
    end

    def request_remove_owner
      params = {
        email: owner
      }
      encoded = JSON.generate(params)
      headers = {
        Authorization: api_key,
        "Content-Type": "application/json"
      }
      Faraday.delete("https://rubygems.org/api/v1/gems/#{gem}/owners.json", params, headers)
    end
  end

  private

    def config
      @config ||= begin
                    file_path = "./config/cli.yaml"
                    yaml_content = File.read(file_path)
                    YAML.load(yaml_content)
                  end
    end

    def samvera_orb_release
      config["samvera_orb_release"]
    end

    def supported_ruby_versions
      config["supported_ruby_versions"]
    end

    def supported_rails_versions
      config["supported_rails_versions"]
    end

    def errors
      @errors ||= []
    end

    def access_token
      ENV['GH_TOKEN']
    end

    def client
      @client ||= Octokit::Client.new(access_token: access_token)
    end

    def repository
      repository ||= client.repo("#{owner}/#{repo}")
    end

    def project_url
      @project_url ||= "https://github.com/orgs/samvera/projects/#{project_id}"
    end

    # This will fail, as projects are only supported with the GraphQL API
    # @see https://docs.github.com/en/rest/projects/projects?apiVersion=2022-11-28
    def columns
      client.project_columns(project_id)
    end

    def column
      columns.first
    end

    def column_id
      column["id"]
    end

    def prepare_github_issue(issue:)
      unless issue.labels.map(&:name).include?(label)

        begin
          client.add_labels_to_an_issue(repository.id, issue.number, [label])
          say("Label ``#{label}\" applied to Issue ##{issue.number}", :green)

          # This will fail, as projects are only supported with the GraphQL API
          # @see https://docs.github.com/en/rest/projects/projects?apiVersion=2022-11-28
          #
          # say("Using #{column_id} for Project '#{project_id}'", :green)
          # project_card = client.create_project_card(column_id, content_id: issue.id, content_type: 'Issue')
          # say("Added Issue ##{issue.number} to Project '#{project_id}'", :green)
        rescue Octokit::Error => e
          say("Failed to audit Issue ##{issue.number}: #{e.message}", :red)
        end
      end
    end

    def create_github_issue(issue_title:, issue_body:)

      issues = client.issues(repository.id)
      existing_issues = issues.select { |issue| issue.title == issue_title }

      if !existing_issues.empty?
        existing_issues.each do |issue|
          say("Issue exists: #{issue.html_url}", :yellow)
          prepare_github_issue(issue: issue)
        end
      else
        issue = self.client.create_issue(repository.id, issue_title, issue_body)
        say("Issue created: #{issue.html_url}", :green)
        prepare_github_issue(issue: issue)
      end
    rescue Octokit::Error => e
      say("Error creating issue: #{e.message}", :red)
    end

    def handle_error(validation_error:)
      say(validation_error, :red)

      unless errors.include?(validation_error)
        issue_title = "CircleCI audit error: #{validation_error}"
        create_github_issue(issue_title: issue_title, issue_body: validation_error)
        errors << validation_error
      end
    end
end

