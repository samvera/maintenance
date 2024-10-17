#!/usr/bin/env ruby

require 'octokit'
require 'thor'

class Samvera < Thor

  desc "audit_issues", "Audits a repository for all stale issues, labels them, and adds a comment to the issue."
  option :repo, required: true, type: :string
  option :updated, type: :string, default: "2021-01-01"
  option :created, type: :string, default: "2021-01-01"
  option :label, type: :string, default: "stale"
  option :project_id, type: :numeric, default: 28
  def audit_issues

    repo = options[:repo]
    created = options[:created]
    updated = options[:updated]
    label = options[:label]

    # Authenticate with GitHub
    client = Octokit::Client.new(access_token: ENV['GH_TOKEN'])

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

          project_url = "https://github.com/orgs/samvera/projects/#{project_id}"
          project_card = client.create_project_card(project_url, content_id: issue.id, content_type: 'Issue')
          say("Added Issue ##{issue.number} to Project '#{project_name}'", :green)
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

    client = Octokit::Client.new(access_token: ENV['GH_TOKEN'])

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

    client = Octokit::Client.new(access_token: ENV['GH_TOKEN'])

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
end

