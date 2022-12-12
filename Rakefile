# frozen_string_literal: true

namespace :templates do
  desc "Push CODE_OF_CONDUCT.md to all repositories, this requires ENV['GITHUB_ACCESS_TOKEN']"
  task :code_of_conduct do
    require 'huborg'
    client = Huborg::Client.new(org_names: %w[samvera samvera-labs])
    client.push_template!(
      template: File.expand_path('./templates/CODE_OF_CONDUCT.md'),
      filename: 'CODE_OF_CONDUCT.md',
      overwrite: true
    )
  end
  desc "Push CONTRIBUTING.md to all repositories, this requires ENV['GITHUB_ACCESS_TOKEN']"
  task :contributing do
    require 'huborg'
    client = Huborg::Client.new(org_names: %w[samvera samvera-labs])
    client.push_template!(
      template: File.expand_path('./templates/CONTRIBUTING.md'),
      filename: 'CONTRIBUTING.md',
      overwrite: true
    )
  end
  desc "Push SUPPORT.md to all repositories, this requires ENV['GITHUB_ACCESS_TOKEN']"
  task :support do
    require 'huborg'
    client = Huborg::Client.new(org_names: %w[samvera samvera-labs])
    client.push_template!(
      template: File.expand_path('./templates/SUPPORT.md'),
      filename: 'SUPPORT.md',
      overwrite: true
    )
  end
end
