# frozen_string_literal: true

require 'spec_helper'
require 'github_api'

describe Samvera::Org, type: :system do
  subject(:cli) { Samvera::Org.new }

  # GitHub Repository responses
  let(:github_repo_object1) do
    double
  end
  let(:github_repo_object2) do
    double
  end
  let(:github_repo_objects) do
    [
      github_repo_object1,
      github_repo_object2
    ]
  end

  # GitHub User responses
  let(:github_admin1) do
    double
  end
  let(:github_admin2) do
    double
  end
  let(:github_user1) do
    double
  end
  let(:github_user2) do
    double
  end

  # Team Responses
  let(:github_team_object1) do
    double
  end
  let(:github_team_object2) do
    double
  end
  let(:github_team_objects) do
    [
      github_team_object1,
      github_team_object2
    ]
  end
  let(:github_user_objects) do
    [
      github_admin1,
      github_admin2,
      github_user1,
      github_user2
    ]
  end

  # GitHub API Responses
  let(:github_admin_team_response) do
    instance_double(::Github::ResponseWrapper)
  end
  let(:github_repos_response) do
    instance_double(::Github::ResponseWrapper)
  end
  let(:github_users_response) do
    instance_double(::Github::ResponseWrapper)
  end

  # GitHub API Client
  let(:github_client) do
    instance_double(::Github::Client)
  end
  # GitHub Organizations
  let(:github_orgs) do
    instance_double(::Github::Client::Orgs)
  end
  # GitHub Teams for a given Organization
  let(:github_orgs_teams) do
    instance_double(::Github::Client::Orgs::Teams)
  end
  # GitHub Repositories for samvera
  let(:github_samvera_repos) do
    instance_double(::Github::Client::Repos)
  end
  # GitHub Repositories for samvera-labs
  let(:github_samvera_labs_repos) do
    instance_double(::Github::Client::Repos)
  end
  # GitHub Users
  let(:github_users) do
    instance_double(::Github::Client::Users)
  end

  # RubyGems API client and responses
  let(:fetcher) do
    double
  end
  let(:spec_tuple1) do
    double
  end
  let(:spec_tuple2) do
    double
  end
  let(:spec_tuples) do
    [
      spec_tuple1,
      spec_tuple2
    ]
  end
  let(:repo1_owners_yaml) do
    [
      {
        id: '10001',
        handle: 'user1'
      },
      {
        id: '10003',
        handle: 'user3'
      }
    ].to_yaml
  end
  let(:repo2_owners_yaml) do
    [
      {
        id: '10002',
        handle: 'user2'
      },
      {
        id: '10004',
        handle: 'jrgriffiniii'
      }
    ].to_yaml
  end

  before do
    ENV['GITHUB_SAMVERA_TOKEN'] = 'secret'

    allow(::Github).to receive(:new).and_return(github_client)
    allow(github_client).to receive(:orgs).and_return(github_orgs)
    allow(github_client).to receive(:repos).with(user: 'samvera').and_return(github_samvera_repos)
    allow(github_client).to receive(:repos).with(user: 'samvera-labs').and_return(github_samvera_labs_repos)
    allow(github_client).to receive(:users).and_return(github_users)
    allow(github_orgs).to receive(:teams).and_return(github_orgs_teams)

    stub_request(:get, 'https://rubygems.org/api/v1/gems/active-fedora/owners.yaml').to_return(
      status: 200,
      body: repo1_owners_yaml,
      headers: {
        'Content-Type': 'application/json'
      }
    )
    stub_request(:get, 'https://rubygems.org/api/v1/gems/repository-2/owners.yaml').to_return(
      status: 200,
      body: repo2_owners_yaml,
      headers: {
        'Content-Type': 'application/json'
      }
    )

    allow(spec_tuple2).to receive(:name).and_return('repository-2')
    allow(spec_tuple1).to receive(:name).and_return('active_fedora')
    allow(fetcher).to receive(:detect).and_yield(spec_tuple1).and_yield(spec_tuple2).and_return(spec_tuples)
    allow(::Gem::SpecFetcher).to receive(:fetcher).and_return(fetcher)

    allow(github_repo_object1).to receive(:name).and_return('active_fedora')
    allow(github_repo_object1).to receive(:html_url).and_return('https://github.com/samvera/active_fedora')
    allow(github_repo_object2).to receive(:name).and_return('repository-2')
    allow(github_repo_object2).to receive(:html_url).and_return('https://github.com/samvera/repository-2')
    allow(github_repos_response).to receive(:to_a).and_return(github_repo_objects)

    allow(github_samvera_repos).to receive(:all).and_return(github_repos_response)
    allow(github_samvera_labs_repos).to receive(:all).and_return([])

    allow(github_team_object1).to receive(:id).and_return('contributors')
    allow(github_team_object1).to receive(:login).and_return('contributors')
    allow(github_team_object1).to receive(:name).and_return('contributors')

    allow(github_team_object2).to receive(:id).and_return('admin')
    allow(github_team_object2).to receive(:login).and_return('admin')
    allow(github_team_object2).to receive(:name).and_return('admins')

    allow(github_admin1).to receive(:login).and_return('admin1')
    allow(github_users).to receive(:get).with(user: 'admin1').and_return(github_admin1)

    allow(github_admin2).to receive(:login).and_return('admin2')
    allow(github_users).to receive(:get).with(user: 'admin2').and_return(github_admin2)

    allow(github_user1).to receive(:login).and_return('user1')
    allow(github_users).to receive(:get).with(user: 'user1').and_return(github_user1)

    allow(github_user2).to receive(:login).and_return('user2')
    allow(github_users).to receive(:get).with(user: 'user2').and_return(github_user2)

    allow(github_orgs_teams).to receive(:list_members).with('admin').and_return([github_admin1, github_admin2])
    allow(github_orgs_teams).to receive(:list_members).with('contributors').and_return([github_user1, github_user2])
    allow(github_orgs_teams).to receive(:list).and_return(github_team_objects)

    stub_request(:post, 'https://rubygems.org/api/v1/gems/active-fedora/owners')
    stub_request(:post, 'https://rubygems.org/api/v1/gems/repository-2/owners')

    stub_request(:delete, 'https://rubygems.org/api/v1/gems/active-fedora/owners')
    stub_request(:delete, 'https://rubygems.org/api/v1/gems/repository-2/owners')

    cli
  end

  after do
    ENV['GITHUB_SAMVERA_TOKEN'] = nil
  end

  describe '#admins' do
    it 'lists all of the GitHub users who have administrative privileges for the Samvera Community' do
      expect { cli.admins }.to output(/admin1/).to_stdout
      expect { cli.admins }.to output(/admin2/).to_stdout
    end
  end

  describe '#contributors' do
    it 'lists all of the GitHub users who have contributor privileges for the Samvera Community' do
      expect { cli.contributors }.to output(/user1/).to_stdout
      expect { cli.contributors }.to output(/user2/).to_stdout
    end
  end

  describe '#repositories' do
    it 'lists all of the GitHub repositories managed by the Samvera Community' do
      expect { cli.repositories }.to output(/active_fedora/).to_stdout
      expect { cli.repositories }.to output(/repository-2/).to_stdout
    end
  end

  describe '#add_owners' do
    it 'adds all of the necessary GitHub users as RubyGems owners to each Gem' do
      cli.add_owners

      expect(a_request(:post, 'https://rubygems.org/api/v1/gems/active-fedora/owners')).to have_been_made.times(2)
      expect(a_request(:post, 'https://rubygems.org/api/v1/gems/repository-2/owners')).to have_been_made.times(2)
    end

    context 'when the Samvera GitHub repository does not have a corresponding RubyGem' do
      let(:github_repo_object3) do
        double
      end
      let(:github_repo_objects) do
        [
          github_repo_object3,
          github_repo_object1,
          github_repo_object2
        ]
      end
      let(:spec_tuples) do
        []
      end

      before do
        allow(github_repo_object3).to receive(:name).and_return('repository-3')
        allow(github_repo_object3).to receive(:html_url).and_return('https://github.com/samvera/repository-3')

        stub_request(:get, 'https://rubygems.org/api/v1/gems/repository-3/owners.yaml').to_return(
          status: 404,
          body: 'This rubygem could not be found.'
        )
      end

      it 'prints a warning' do
        expect { cli.add_owners }.to output(/Could not find the Gem for repository-3/).to_stdout
        expect(a_request(:post, 'https://rubygems.org/api/v1/gems/repository-3/owners')).not_to have_been_made.once
      end
    end

    context 'when an error is encountered when requesting to modify the RubyGem Owners' do
      let(:github_repo_object3) do
        double
      end
      let(:github_repo_objects) do
        [
          github_repo_object1,
          github_repo_object2,
          github_repo_object3
        ]
      end
      let(:spec_tuple3) do
        double
      end
      let(:spec_tuples) do
        [
          spec_tuple1,
          spec_tuple2,
          spec_tuple3
        ]
      end

      before do
        allow(github_repo_object3).to receive(:name).and_return('repository-3')
        allow(github_repo_object3).to receive(:html_url).and_return('https://github.com/samvera/repository-3')

        allow(spec_tuple3).to receive(:name).and_return('repository-3')
        stub_request(:get, 'https://rubygems.org/api/v1/gems/repository-3/owners.yaml').to_return(
          status: 200,
          body: repo1_owners_yaml,
          headers: {
            'Content-Type': 'application/json'
          }
        )
        stub_request(:post, 'https://rubygems.org/api/v1/gems/repository-3/owners').to_return(status: 500, body: 'error')
      end

      it 'raises a Thor::Error' do
        expect { cli.add_owners }.to raise_error(Thor::Error, /Error raised while adding the Gem owner admin1 for repository-3/)
      end
    end
  end

  describe '#remove_owners' do
    it 'removes all of the necessary GitHub users as RubyGems owners to each Gem' do
      cli.remove_owners

      expect(a_request(:delete, 'https://rubygems.org/api/v1/gems/active-fedora/owners')).to have_been_made.times(2)
      expect(a_request(:delete, 'https://rubygems.org/api/v1/gems/repository-2/owners')).to have_been_made.times(2)
    end

    context 'when the Samvera GitHub repository does not have a corresponding RubyGem' do
      let(:github_repo_object3) do
        double
      end
      let(:github_repo_objects) do
        [
          github_repo_object3,
          github_repo_object1,
          github_repo_object2
        ]
      end
      let(:spec_tuples) do
        []
      end

      before do
        allow(github_repo_object3).to receive(:name).and_return('repository-3')
        allow(github_repo_object3).to receive(:html_url).and_return('https://github.com/samvera/repository-3')

        stub_request(:get, 'https://rubygems.org/api/v1/gems/repository-3/owners.yaml').to_return(
          status: 404,
          body: 'This rubygem could not be found.'
        )
      end

      it 'prints a warning' do
        expect { cli.remove_owners }.to output(/Could not find the Gem for repository-3/).to_stdout
        expect(a_request(:delete, 'https://rubygems.org/api/v1/gems/repository-3/owners')).not_to have_been_made.once
      end
    end

    context 'when an error is encountered when requesting to modify the RubyGem Owners' do
      let(:github_repo_object3) do
        double
      end
      let(:github_repo_objects) do
        [
          github_repo_object1,
          github_repo_object2,
          github_repo_object3
        ]
      end
      let(:spec_tuple3) do
        double
      end
      let(:spec_tuples) do
        [
          spec_tuple1,
          spec_tuple2,
          spec_tuple3
        ]
      end

      before do
        allow(github_repo_object3).to receive(:name).and_return('repository-3')
        allow(github_repo_object3).to receive(:html_url).and_return('https://github.com/samvera/repository-3')

        allow(spec_tuple3).to receive(:name).and_return('repository-3')
        stub_request(:get, 'https://rubygems.org/api/v1/gems/repository-3/owners.yaml').to_return(
          status: 200,
          body: repo1_owners_yaml,
          headers: {
            'Content-Type': 'application/json'
          }
        )
        stub_request(:delete, 'https://rubygems.org/api/v1/gems/repository-3/owners').to_return(status: 500, body: 'error')
      end

      it 'raises a Thor::Error' do
        expect { cli.remove_owners }.to raise_error(Thor::Error, /Error raised while removing the Gem owner admin1 for repository-3/)
      end
    end
  end
end
