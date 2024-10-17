#!/usr/bin/env ruby

require 'octokit'
require 'thor'

class Samvera < Thor

  desc "audit_issues", "Audits a repository for all stale issues, labels them, and adds a comment to the issue."
  option :repo, required: true, type: :string
  option :updated, type: :string, default: "2021-01-01"
  option :created, type: :string, default: "2021-01-01"
  option :label, type: :string, default: "stale"
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
        rescue Octokit::Error => e
          say("Failed to audit Issue ##{issue.number}: #{e.message}", :red)
        end
      else
        say("Issue ##{issue.number} already has the ``#{label}\" label", :yellow)
      end
      say("-" * 40, :green)
    end
  end
end

