# Component Maintenance Interest Group

This repository holds templates and guidelines to support the maintenance of projects in the [Samvera](https://github.com/samvera) Github organization.

## GitHub Project

Tasks for the ongoing maintenance efforts currently being undertaken by members of the Samvera Community are tracked and regularly updated using the [Samvera Component Maintenance Project](https://github.com/orgs/samvera/projects/28/views/3).

## Samvera Core Components

Samvera Core Components are defined as the following:

> The primary Samvera code repository contains the Samvera community’s current consensus on what we are using, maintaining, and recommending. Ideally, this repository only contains code modules that are being actively used and maintained.

_Please reference [A Guide for the Samvera Community](https://samvera.github.io/core_components.html) for further information._

Currently, there are twenty Samvera Core Components maintained by the community:

### Ruby Samvera Components

| Component | CircleCI Status | Ruby 3.1 Support | Ruby 3.0 Support | Ruby 2.7 Support | Ruby 2.6 Support | Rails 7.0 Support | Rails 6.1 Support | Rails 6.0 Support | Rails 5.2 Support |
| --- | --- | --- | --- | --- | --- | --- | --- | --- | --- |
| [active_fedora](https://github.com/samvera/active_fedora)                             | [![Build Status](https://circleci.com/gh/samvera/active_fedora.svg?style=svg)](https://circleci.com/gh/samvera/active_fedora)                             |                  |                  | 2.7.0            | 2.6.5            |                   |                   | 6.0.2             | 5.2.4             |
| [bixby](https://github.com/samvera/bixby)                                             | [![Build Status](https://circleci.com/gh/samvera/bixby.svg?style=svg)](https://circleci.com/gh/samvera/bixby)                                             | 3.1.1            | 3.0.3            | 2.7.5            | 2.6.9            | N/A               | N/A               | N/A               | N/A               |
| [browse-everything](https://github.com/samvera/browse-everything)                     | [![Build Status](https://circleci.com/gh/samvera/browse-everything.svg?style=svg)](https://circleci.com/gh/samvera/browse-everything)                     |                  |                  | 2.7.5            | 2.6.9            |                   |                   | 6.0.4.7           | 5.2.4             |
| [hydra-derivatives](https://github.com/samvera/hydra-derivatives)                     | [![Build Status](https://circleci.com/gh/samvera/hydra-derivatives.svg?style=svg)](https://circleci.com/gh/samvera/hydra-derivatives)                     |                  |                  | 2.7.5            | 2.6.9            | N/A               | N/A               | N/A               | N/A               |
| [hydra-editor](https://github.com/samvera/hydra-editor)                               | [![Build Status](https://circleci.com/gh/samvera/hydra-editor.svg?style=svg)](https://circleci.com/gh/samvera/hydra-editor)                               |                  |                  | 2.7.5            | 2.6.9            |                   |                   | 6.0.3.4           | 5.2.3             |
| [hydra-file_characterization](https://github.com/samvera/hydra-file_characterization) | [![Build Status](https://circleci.com/gh/samvera/hydra-file_characterization.svg?style=svg)](https://circleci.com/gh/samvera/hydra-file_characterization) |                  | 3.0.3            | 2.7.5            | 2.6.9            | 7.0.2.3           | 6.1.5             | 6.0.4.7           | 5.2.7             |
| [hydra-head](https://github.com/samvera/hydra-head)                                   | [![Build Status](https://circleci.com/gh/samvera/hydra-head.svg?style=svg)](https://circleci.com/gh/samvera/hydra-head)                                   |                  |                  | 2.7.3            | 2.6.7            |                   |                   | 6.0.3.7           | 5.2.6             |
| [hydra-pcdm](https://github.com/samvera/hydra-pcdm)                                   | [![Build Status](https://circleci.com/gh/samvera/hydra-pcdm.svg?style=svg)](https://circleci.com/gh/samvera/hydra-pcdm)                                   |                  |                  | 2.7.5            | 2.6.9            |                   |                   | 6.0.2             | 5.2.4             |
| [hydra-role-management](https://github.com/samvera/hydra-role-management)             | [![Build Status](https://circleci.com/gh/samvera/hydra-role-management.svg?style=svg)](https://circleci.com/gh/samvera/hydra-role-management)             |                  |                  | 2.7.5            | 2.6.9            |                   |                   | 6.0.2             | 5.2.4             |
| [hydra-works](https://github.com/samvera/hydra-works)                                 | [![Build Status](https://circleci.com/gh/samvera/hydra-works.svg?style=svg)](https://circleci.com/gh/samvera/hydra-works)                                 |                  |                  | 2.7.5            | 2.6.9            |                   |                   | 6.0.3.1           | 5.2.4.3           | [![Build Status](https://circleci.com/gh/samvera/hydra-works.svg?style=svg)](https://circleci.com/gh/samvera/hydra-works) |
| [iiif_manifest](https://github.com/samvera/iiif_manifest)                             | [![Build Status](https://circleci.com/gh/samvera/iiif_manifest.svg?style=svg)](https://circleci.com/gh/samvera/iiif_manifest)                             |                  | 3.0.3            | 2.7.5            | 2.6.9            | N/A               | N/A               | N/A               | N/A               |
| [ldp](https://github.com/samvera/ldp)                                                 | [![Build Status](https://circleci.com/gh/samvera/ldp.svg?style=svg)](https://circleci.com/gh/samvera/ldp)                                                 |                  |                  | 2.7.5            | 2.6.9            |                   |                   | 6.0.4.4           | 5.2.0             |
| [noid-rails](https://github.com/samvera/noid-rails)                                   | [![Build Status](https://circleci.com/gh/samvera/noid-rails.svg?style=svg)](https://circleci.com/gh/samvera/noid-rails)                                   |                  |                  | 2.7.5            | 2.6.9            |                   | 6.1.3.2           | 6.0.3.2           | 5.2.4.3           |
| [questioning_authority](https://github.com/samvera/questioning_authority)             | [![Build Status](https://circleci.com/gh/samvera/questioning_authority.svg?style=svg)](https://circleci.com/gh/samvera/questioning_authority)             |                  |                  | 2.7.5            | 2.6.9            |                   | 6.1.1             | 6.0.2             | 5.2.4             |
| [rubydora](https://github.com/samvera/rubydora)                                       | [![Build Status](https://circleci.com/gh/samvera/rubydora.svg?style=svg)](https://circleci.com/gh/samvera/rubydora)                                       |                  |                  | 2.7.5            | 2.6.9            |                   |                   | 6.0.2             | 5.2.4             |
| [samvera.github.io](https://github.com/samvera/samvera.github.io)                     | [![Build Status](https://circleci.com/gh/samvera/samvera.github.io.svg?style=svg)](https://circleci.com/gh/samvera/samvera.github.io)                     | 3.1.1            | 3.0.3            | 2.7.5            | 2.6.9            | N/A               | N/A               | N/A               | N/A               |
| [samvera-circleci-orb](https://github.com/samvera/samvera-circleci-orb)               | [![Build Status](https://circleci.com/gh/samvera/samvera-circleci-orb.svg?style=svg)](https://circleci.com/gh/samvera/samvera-circleci-orb)               | N/A              | N/A              | N/A              | N/A              | N/A               | N/A               | N/A               | N/A               |
| [valkyrie](https://github.com/samvera/valkyrie)                                       | [![Build Status](https://circleci.com/gh/samvera/valkyrie.svg?style=svg)](https://circleci.com/gh/samvera/valkyrie)                                       |                  |                  | 2.7.5            | 2.6.5            |                   |                   | 6.0.5             | 5.2.8             |

### JavaScript Samvera Components

| Component                                                     | CircleCI Status                                                                                                                   | Node.js 18.x Support | Node.js 16.x Support | Node.js 14.x Support |
| ------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------- | -------------------- | -------------------- | -------------------- |
| [node-iiif](https://github.com/samvera/node-iiif)             | [![Build Status](https://circleci.com/gh/samvera/node-iiif.svg?style=svg)](https://circleci.com/gh/samvera/node-iiif)             | N/A                  | N/A                  | N/A                  | N/A | N/A | N/A | N/A | N/A |
| [serverless-iiif](https://github.com/samvera/serverless-iiif) | [![Build Status](https://circleci.com/gh/samvera/serverless-iiif.svg?style=svg)](https://circleci.com/gh/samvera/serverless-iiif) | N/A                  | N/A                  | N/A                  | N/A | N/A | N/A | N/A | N/A |

## Maintenance Documentation

- [ORGS](./ORGS.md) - Reference guide for the structure of GitHub Organizations (`samvera`, `samvera-labs`, and `samvera-deprecated`)
- [TEAMS](./TEAMS.md) - Reference guide for the structure of GitHub Teams within the `samvera`, `samvera-labs`, and `samvera-deprecated` Organizations
- [RELEASES](./ruby/RELEASES.md) - Reference guide for the releasing Ruby Gem components maintained by the Samvera Community

## Promoting Samvera Projects to Core Components

In order for Samvera GitHub repositories to become components, a process of promotion is in place. Prior to being considered for promotion, the repository must first be migrated to [Samvera Labs](https://github.com/samvera-labs). Alternatively, one may also create an entirely new project within Samvera Labs (there are no restrictions for creating GitHub repositories within this organization).

The established requirements for promoting a project to a core component are the following:

### Code Quality Requirements
    1. Software unit and integration test suites using a framework such as [RSpec](https://rspec.info/) or [Jest for JavaScript](https://jestjs.io/). While there is no minimum threshold for test coverage, usage of tools such as [SimpleCov for Ruby](https://github.com/simplecov-ruby/simplecov) or [Jest test coverage analysis features](https://jestjs.io/docs/configuration#collectcoverage-boolean) are encouraged (but not required)

    1. Employs a source code linting tool such as [Bixby](https://github.com/samvera/bixby) or [Prettier](https://github.com/prettier/prettier) in order to enforce style guidelines within the source code base

    1. Show compatibility with current Ruby and Rails versions and other dependencies, when was it last tested. Note compatibility with prior versions when available. Compatibility can be specified in the gemspec(s) or verified within the CI configuration

    1. Uses continuous integration to automate the execution of test suites (preferably CircleCI, unless there is a compelling reason to do something else). For CircleCI, also strongly encouraged would be the usage of [Samvera CircleCI Orb](https://github.com/samvera/samvera-circleci-orb)

    1. Code must feature releases using [RubyGems](https://rubygems.org/) or the [NPM](https://www.npmjs.com/), and offer a release version >= 1.0.0

    1. Code releases must follow the [Semantic Versioning specification](https://semver.org/) standards

### Documentation Requirements
Currently, the documentation files for each core component are derived from templates tracked within this repository:

    1. [`README.md`](https://github.com/samvera/maintenance/blob/main/templates/README.md)

    1. [`LICENSE`](https://github.com/samvera/maintenance/blob/main/templates/LICENSE)

    1. [`CODE_OF_CONDUCT.md`](https://github.com/samvera/maintenance/blob/main/templates/CODE_OF_CONDUCT.md)

    1. [`SUPPORT.md`](https://github.com/samvera/maintenance/blob/main/templates/SUPPORT.md)

    1. [`CONTRIBUTING.md`](https://github.com/samvera/maintenance/blob/main/templates/CONTRIBUTING.md)

    1. Known issues documented in GitHub Issues

    1. Resolve any `TODO` comments within the code base (or, remove the comments and please create these as GitHub Issues)

### Community Use Requirements

    1. Community use by three or more organizations

    1. In active use for six months

    1. Has an ongoing maintenance plan

### Proposing a Project to the Community for Promotion

As needed or requested, code repositories are reviewed for promotion and deprecation. To start this process, email the [Samvera Tech Google Group](https://groups.google.com/g/samvera-tech) with a request. Provide documentation that all of the above requirements have been met. Then propose an agenda item on the next [Samvera Tech Call](https://samvera.atlassian.net/wiki/spaces/samvera/pages/405211059/Notes+from+Tech+Meetings+and+Calls) to discuss the issue. Once the promotion has been decided, another email should go out to the group with an announcement.

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

There exist Ruby scripts in this repository that can be used to propagate some of these templates. These are located within `ruby/scripts/`:

### Querying for Gem Metadata

This queries for and prints to the `STDOUT` Gem metadata for each Samvera repository:

```bash
$ bundle exec ruby ./ruby/script/bundled-gem-release-dates.rb
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
$ bundle exec ruby ./ruby/script/grant_revoke_gem_authority.rb
```

One may also explicitly request that all existing ownership permissions be revoked before adding permissions for each Gem:

```bash
$ WITH_REVOKE=true bundle exec ruby ./ruby/script/grant_revoke_gem_authority.rb
```

## Contributing

If you're working on PR for this project, create a feature branch off of `main`.

This repository follows the [Samvera Community Code of Conduct](https://samvera.atlassian.net/wiki/spaces/samvera/pages/405212316/Code+of+Conduct) and [language recommendations](https://github.com/samvera/maintenance/blob/main/templates/CONTRIBUTING.md#language). Please **_do not_** create a branch called `master` for this repository or as part of your pull request; the branch will either need to be removed or renamed before it can be considered for inclusion in the code base and history of this repository.
