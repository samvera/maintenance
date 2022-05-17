# Component Maintenance Interest Group

This repository holds templates and guidelines to support the maintenance of projects in the [Samvera](https://github.com/samvera) Github organization.

## Samvera Core Components

Samvera Core Components are defined as the following:

> The primary Samvera code repository contains the Samvera community’s current consensus on what we are using, maintaining, and recommending. Ideally, this repository only contains code modules that are being actively used and maintained.

_Please reference [A Guide for the Samvera Community](https://samvera.github.io/core_components.html) for further information._

Currently, there are eighteen Samvera Core Components maintained by the community:

| Component | Latest Release | CircleCI Status | Ruby 3.1 Support | Ruby 3.0 Support | Ruby 2.7 Support | Ruby 2.6 Support | Rails 7.0 Support | Rails 6.1 Support | Rails 6.0 Support | Rails 5.2 Support |
| --------- | -------------- |---------------- | ---------------- | ---------------- | ---------------- | ----------------- | ---------------- | ---------------- | ---------------- | --------------- |
| [active_fedora](https://github.com/samvera/active_fedora) | [![Version](https://img.shields.io/gem/v/active-fedora)](https://rubygems.org/gems/active-fedora) | [![Build Status](https://circleci.com/gh/samvera/active_fedora.svg?style=svg)](https://circleci.com/gh/samvera/active_fedora) |  |  | 2.7.0 | 2.6.5 |  |  | 6.0.2 | 5.2.4 |
| [bixby](https://github.com/samvera/bixby) | [![Version](https://img.shields.io/gem/v/bixby)](https://rubygems.org/gems/bixby) | [![Build Status](https://circleci.com/gh/samvera/bixby.svg?style=svg)](https://circleci.com/gh/samvera/bixby) | 3.1.1 | 3.0.3 | 2.7.5 | 2.6.9 | N/A | N/A | N/A | N/A |
| [browse-everything](https://github.com/samvera/browse-everything) | [![Version](https://img.shields.io/gem/v/browse-everything)](https://rubygems.org/gems/browse-everything) | [![Build Status](https://circleci.com/gh/samvera/browse-everything.svg?style=svg)](https://circleci.com/gh/samvera/browse-everything) |  |  | 2.7.5 | 2.6.9 |  |  | 6.0.4.7 | 5.2.4 |
| [hydra-derivatives](https://github.com/samvera/hydra-derivatives) | [![Version](https://img.shields.io/gem/v/hydra-derivatives)](https://rubygems.org/gems/hydra-derivatives) | [![Build Status](https://circleci.com/gh/samvera/hydra-derivatives.svg?style=svg)](https://circleci.com/gh/samvera/hydra-derivatives) |  |  | 2.7.5 | 2.6.9 | N/A | N/A | N/A | N/A |
| [hydra-editor](https://github.com/samvera/hydra-editor) | [![Version](https://img.shields.io/gem/v/hydra-editor)](https://rubygems.org/gems/hydra-editor) | [![Build Status](https://circleci.com/gh/samvera/hydra-editor.svg?style=svg)](https://circleci.com/gh/samvera/hydra-editor) |  |  | 2.7.5 | 2.6.9 |  |  | 6.0.3.4 | 5.2.3 |
| [hydra-file_characterization](https://github.com/samvera/hydra-file_characterization) | [![Version](https://img.shields.io/gem/v/hydra-file_characterization)](https://rubygems.org/gems/hydra-file_characterization) | [![Build Status](https://circleci.com/gh/samvera/hydra-file_characterization.svg?style=svg)](https://circleci.com/gh/samvera/hydra-file_characterization) |  | 3.0.3 | 2.7.5 | 2.6.9 | 7.0.2.3 | 6.1.5 | 6.0.4.7 | 5.2.7 |
| [hydra-head](https://github.com/samvera/hydra-head) | [![Version](https://img.shields.io/gem/v/hydra-head)](https://rubygems.org/gems/hydra-head) | [![Build Status](https://circleci.com/gh/samvera/hydra-head.svg?style=svg)](https://circleci.com/gh/samvera/hydra-head) |  |  | 2.7.3 | 2.6.7 |  |  | 6.0.3.7 | 5.2.6 |
| [hydra-pcdm](https://github.com/samvera/hydra-pcdm) | [![Version](https://img.shields.io/gem/v/hydra-pcdm)](https://rubygems.org/gems/hydra-pcdm) | [![Build Status](https://circleci.com/gh/samvera/hydra-pcdm.svg?style=svg)](https://circleci.com/gh/samvera/hydra-pcdm) |  |  | 2.7.5 | 2.6.9 |  |  | 6.0.2 | 5.2.4 |
| [hydra-role-management](https://github.com/samvera/hydra-role-management) |[![Version](https://img.shields.io/gem/v/hydra-role-management)](https://rubygems.org/gems/hydra-role-management) | [![Build Status](https://circleci.com/gh/samvera/hydra-role-management.svg?style=svg)](https://circleci.com/gh/samvera/hydra-role-management) |  |  | 2.7.5 | 2.6.9 |  |  | 6.0.2 | 5.2.4 |
| [hydra-works](https://github.com/samvera/hydra-works) | [![Version](https://img.shields.io/gem/v/hydra-works)](https://rubygems.org/gems/hydra-works) | [![Build Status](https://circleci.com/gh/samvera/hydra-works.svg?style=svg)](https://circleci.com/gh/samvera/hydra-works)|  |  | 2.7.5 | 2.6.9 |  |  | 6.0.3.1 | 5.2.4.3 | [![Build Status](https://circleci.com/gh/samvera/hydra-works.svg?style=svg)](https://circleci.com/gh/samvera/hydra-works) |
| [iiif_manifest](https://github.com/samvera/iiif_manifest) | [![Version](https://img.shields.io/gem/v/iiif_manifest)](https://rubygems.org/gems/iiif_manifest) | [![Build Status](https://circleci.com/gh/samvera/iiif_manifest.svg?style=svg)](https://circleci.com/gh/samvera/iiif_manifest) |  | 3.0.3 | 2.7.5 | 2.6.9 | N/A | N/A | N/A | N/A |
| [ldp](https://github.com/samvera/ldp) | [![Version](https://img.shields.io/gem/v/ldp)](https://rubygems.org/gems/ldp) | [![Build Status](https://circleci.com/gh/samvera/ldp.svg?style=svg)](https://circleci.com/gh/samvera/ldp) |  |  | 2.7.5 | 2.6.9 |  |  | 6.0.4.4 | 5.2.0 |
| [noid-rails](https://github.com/samvera/noid-rails) | [![Version](https://img.shields.io/gem/v/noid-rails)](https://rubygems.org/gems/noid-rails) | [![Build Status](https://circleci.com/gh/samvera/noid-rails.svg?style=svg)](https://circleci.com/gh/samvera/noid-rails) |  |  | 2.7.5 | 2.6.9 |  | 6.1.3.2 | 6.0.3.2 | 5.2.4.3 |
| [questioning_authority](https://github.com/samvera/questioning_authority) | [![Version](https://img.shields.io/gem/v/questioning_authority)](https://rubygems.org/gems/questioning_authority) | [![Build Status](https://circleci.com/gh/samvera/questioning_authority.svg?style=svg)](https://circleci.com/gh/samvera/questioning_authority) |  |  | 2.7.5 | 2.6.9 |  | 6.1.1 | 6.0.2 | 5.2.4 |
| [rubydora](https://github.com/samvera/rubydora) | [![Version](https://img.shields.io/gem/v/rubydora)](https://rubygems.org/gems/rubydora) | [![Build Status](https://circleci.com/gh/samvera/rubydora.svg?style=svg)](https://circleci.com/gh/samvera/rubydora) |  |  | 2.7.5 | 2.6.9 |  |  | 6.0.2 | 5.2.4 |
| [samvera.github.io](https://github.com/samvera/samvera.github.io) | N/A | [![Build Status](https://circleci.com/gh/samvera/samvera.github.io.svg?style=svg)](https://circleci.com/gh/samvera/samvera.github.io) | 3.1.1 | 3.0.3 | 2.7.5 | 2.6.9 | N/A | N/A | N/A | N/A |
| [samvera-circleci-orb](https://github.com/samvera/samvera-circleci-orb) | [![Version](https://badges.circleci.com/orbs/samvera/circleci-orb.svg)](https://circleci.com/developer/orbs/orb/samvera/circleci-orb) | [![Build Status](https://circleci.com/gh/samvera/samvera-circleci-orb.svg?style=svg)](https://circleci.com/gh/samvera/samvera-circleci-orb) | N/A | N/A | N/A | N/A | N/A | N/A | N/A | N/A |
| [valkyrie](https://github.com/samvera/valkyrie) | [![Version](https://img.shields.io/gem/v/valkyrie)](https://rubygems.org/gems/valkyrie) | [![Build Status](https://circleci.com/gh/samvera/valkyrie.svg?style=svg)](https://circleci.com/gh/samvera/valkyrie) |  |  | 2.7.5 | 2.6.5 |  |  | 6.0.5 | 5.2.8 |

## Promoting Samvera Projects to Core Components

In order for Samvera GitHub repositories to become components, a process of promotion is in place. Prior to being considered for promotion, the repository must first be migrated to [Samvera Labs](https://github.com/samvera-labs). Alternatively, one may also create an entirely new project within Samvera Labs (there are no restrictions for creating GitHub repositories within this organization).

The established requirements for promoting a project to a core component are the following:

### Code Quality Requirements
- Good software test coverage measured using a tool such as [simplecov for Ruby](https://github.com/simplecov-ruby/simplecov) or [Jest for JavaScript](https://jestjs.io/docs/configuration#collectcoverage-boolean) (e.g. 100% or 75% of what’s important)
- Employs a source code linting tool such as [bixby](https://github.com/samvera/bixby) or [prettier](https://github.com/prettier/prettier) in order to enforce style guidelines within the source code base
- Uses continuous integration to automate the execution of test suites (Preferably CircleCI, unless there is a compelling reason to do something else)
- Demonstrates compatibility with the latest releases of Ruby (and, where appropriate, Rails and JavaScript)
- Code must features releases using RubyGems or the NPM, and offer a release version >= 1.0.0
- Code releases must follow the [Semantic Versioning specification](https://semver.org/) standards

### Documentation Requirements

Currently, the documentation files for each core component are derived from templates tracked within this repository:

- [README.md](./templates/README.md) - The elements in this template should be in every repository. Additional elements may be added.
- [SUPPORT.md](./templates/SUPPORT.md) - Copy this and replace `{{library}}` with the repository name. This is linked from the README and has information on how to create an issue, email the list, and connect to Slack.
- [CONTRIBUTING.md](./templates/CONTRIBUTING.md) - Contribution guidelines for Samvera projects. Should be included. Minimal customization should be necessary.
- [CODE_OF_CONDUCT.md](./templates/CODE_OF_CONDUCT.md) - Should be included verbatim in every Samvera repository. If this is updated, it needs to be distributed to all Samvera organization repositories.
- [LICENSE](./templates/LICENSE) - Should be included in every Samvera repository. The copyright statements may change as appropriate. This template was taken from guidelines found on the [wiki](https://wiki.duraspace.org/display/samvera/Code+Copyright+Statement).
- [MAILMAP](./templates/MAILMAP) - A master template for [git mailmap](https://www.git-scm.com/docs/git-check-mailmap). This template is something to push to all samvera repositories. The goal in applying a common mailmap is to help understand contributions as people move and change roles/functions/laptops.

### Community Use Requirements

- Community use by three or more Samvera institutions or organizations
- In active use for six months
- Offers an ongoing maintenance roadmap

### Proposing a Project to the Community for Promotion

As needed or requested, code repositories are reviewed for promotion. To start this process, email [the Samvera Tech Google Group](https://groups.google.com/g/samvera-tech) with a request. Provide documentation that all of the above requirements have been met. Ask for a spot on the next developer’s call to discuss the issue. Once the promotion has been decided, another email should go out to the list with an announcement.

## Releases and GitHub Milestones

Releases for core components must please follow the [Semantic Versioning specification](https://semver.org/). Releases must be addressed using both [GitHub](https://docs.github.com/en/repositories/releasing-projects-on-github/managing-releases-in-a-repository) and, where appropriate, [RubyGems](https://guides.rubygems.org/publishing/). Further it is recommended that a `CHANGELOG` please also be updated to document the most recent changes (please see URL and URL for an outline of best practices).

Releasing involves creating a git tag tracking the last git commit to be included within the new release. As each release is published, it may be helpful to track GitHub issues tied using [Milestones](https://docs.github.com/en/issues/using-labels-and-milestones-to-track-work/about-milestones) specifying the next potential release in each series of releases. For example, say that there exists a component with three major releases:

- 3.0.0
- 2.2.1
- 1.1.2

Following this approach, at minimum, three milestones would then exist for the next successive `PATCH` release in each series:

- 3.0.1
- 2.2.2
- 1.1.3

There is no required number of series of releases which must actively remain supported beyond the current series. Further, one may also wish to take a more proactive approach, and manage future `MINOR` releases as well:

- 3.1.0
- 3.0.2
- 2.3.0
- 2.2.2
- 1.2.0
- 1.1.3

### Branches

Often times when maintaining multiple series of releases, it is quite helpful to have a set of matching `git branches` for these releases. Returning to this example case, one could have the following branches:

- `3.x-stable`
- `2.x-stable`
- `1.x-stable`

Further branches should not be necessary, as `MINOR` releases should always be backwards compatible (i. e. those using release 2.2.1 should be able to upgrade to 2.3.0 without encountering errors).

## Samvera Component Repository Labels

The following common set of standard GitHub issue labels are available for each repository, and their usage is encouraged please:

| Label | Description |
| ----- | ----------- |
| a11y | Compliance with accessibility (a11y) standards |
| bug | Unexpected feature behavior or software error  |
| ci | Continuous integration |
| code-coverage | Coverage of the code base using unit, integration, or automated acceptance test suites |
| documentation | Documentation in the form of GitHub Markdown, GitHub Wiki, or code comments (e. g. rdoc or Yard) |
| enhancement | Feature improvement or a new feature |
| maintenance | A task or action delegated to the Component Interest Group |
| question | A discussion regarding any aspect of the code base (including documentation or continuous integration) |
| security | An update addressing a known vulnerability in the code base (or in a dependency) |

## Core Component Utilities in Ruby

There exist Ruby scripts in this repository that can be used to propagate some of these templates:

### Querying for Gem Metadata

This queries for and prints to the `STDOUT` Gem metadata for each Samvera repository:

```bash
$ bundle exec ruby bundled-gem-release-dates.rb
```

The output is formatted using the following structure:

```bash
# Read through the current directories list of bundled gems. Capture
# each gem's specification. Sort the specifications by version release
# date, and print one line per gem. Note, this takes some time to run.
#
# Example:
#
#   2020-06-11  1.40.0  rubocop-rspec
#   2020-06-11  1.329.0 aws-partitions
#   2020-06-12  3.99.2  aws-sdk-core
#   2020-06-12  1.0.1   ldp
```

### Updating Gem Ownership Permissions

This ensures that a list maintained within this repository have the proper permissions for all Samvera repositories:

```bash
$ bundle exec ruby grant_revoke_gem_authority.rb
```

One may also explicitly request that all existing ownership permissions be revoked before adding permissions for each Gem:

```bash
$ WITH_REVOKE=true bundle exec ruby ./script/grant_revoke_gem_authority.rb
```

## Contributing

If you're working on PR for this project, create a feature branch off of `main`.

This repository follows the [Samvera Community Code of Conduct](https://samvera.atlassian.net/wiki/spaces/samvera/pages/405212316/Code+of+Conduct) and [language recommendations](https://github.com/samvera/maintenance/blob/main/templates/CONTRIBUTING.md#language).  Please ***do not*** create a branch called `master` for this repository or as part of your pull request; the branch will either need to be removed or renamed before it can be considered for inclusion in the code base and history of this repository.
