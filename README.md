# Component Maintenance Interest Group

This repository holds templates and guidelines to support the maintenance of projects in the [Samvera](https://github.com/samvera) Github organization.

## Samvera GitHub Organization

The Samvera GitHub Organization (https://github.com/samvera/) contains `git` repositories for multiple projects developed and actively maintained by the Samvera Community.

Tasks for the ongoing maintenance efforts currently being undertaken by members of the Samvera Community are tracked and regularly updated using the [Samvera Component Maintenance Project](https://github.com/orgs/samvera/projects/28/views/3).

The projects themselves may be divided into five distinct groups:

- Hyrax (and the Hyrax Ecosystem)
- Samvera Ruby Gems
- Samvera JavaScript Projects
- Samvera Infrastructure
- Samvera Administration

### Hyrax
_(and the Hyrax Ecosystem)_

Hyrax stands as an open source, self-deposit repository project, which has been actively maintained and under continuous development for approximately seven years. GitHub repositories exist for Samvera which actively maintain not only the [Hyrax source code base](https://github.com/samvera/hyrax), but which provide [a framework for deploying Hyrax implementations using virtualized server or cloud infrastructure](https://github.com/samvera/hyku), along with other projects supporting Hyrax infrastructure.

### Samvera Ruby Gems
_(formerly labeled as "Core Components")_

Samvera Ruby Gems are published as small, modular software libraries which were designed to be adopted by [Ruby on Rails](https://rubyonrails.org/) application developers who seek to implement digital object repositories. Core Components permit developers to benefit from, and contribute to Samvera for cases in which Hyrax might be impractical or unsatisfactory for their organizational requirements.

### Samvera JavaScript Projects

While Hyrax and Samvera Ruby Gems provide a suite of solutions for web application developers seeking to implement digital object repositories, there exist a small, but growing number of projects which exclusively provide user interface features and functionality. These are expected to provide published JavaScript packages using the [npm](https://npmjs.com), and, being under the open source Apache 2.0 license, are most welcome for contributors.

### Samvera Infrastructure

There also exist those Samvera Community projects which provide some hosted service which integrates into a digital object repository ecosystem, but which does not provide any enhanced user interface (or, which are not intended for usage by humans). Within this category fall serverless functions, microservices, configuration management templates, and virtualization utilities.

### Samvera Administration

Projects categorized for Samvera Administration typically provide some function related to community management (such as [this repository](https://github.com/samvera/maintenance)).

## Maintenance Requirements

There are explicitly stated guidelines for maintaining projects within the Samvera Organization:

Samvera Core Components are defined as the following:

> The primary Samvera code repository contains the Samvera community’s current consensus on what we are using, maintaining, and recommending. Ideally, this repository only contains code modules that are being actively used and maintained.

_Please reference [A Guide for the Samvera Community](https://samvera.github.io/core_components.html) for further information._

### Hyrax Ecosystem
| Project | CI Status |
| --- | --- |
|[hyrax](https://github.com/samvera/hyrax)|[![Build Status](https://circleci.com/gh/samvera/hyrax.svg?style=svg)](https://circleci.com/gh/samvera/hyrax)|
|[hyku](https://github.com/samvera/hyku)|[![Build Status](https://circleci.com/gh/samvera/hyku.svg?style=svg)](https://circleci.com/gh/samvera/hyku)|

### Samvera Ruby Gems

| Gem | CI Status | Ruby 3.2 Support | Ruby 3.1 Support | Rails 7.0 Support |
| --- | --- | --- | --- | --- |
|[hydra-derivatives](https://github.com/samvera/hydra-derivatives)|[![Build Status](https://circleci.com/gh/samvera/hydra-derivatives.svg?style=svg)](https://circleci.com/gh/samvera/hydra-derivatives)|✅|✅|✅|
|[iiif_manifest](https://github.com/samvera/iiif_manifest)|[![Build Status](https://circleci.com/gh/samvera/iiif_manifest.svg?style=svg)](https://circleci.com/gh/samvera/iiif_manifest)|✅|✅|✅|
|[ldp](https://github.com/samvera/ldp)|[![Build Status](https://circleci.com/gh/samvera/ldp.svg?style=svg)](https://circleci.com/gh/samvera/ldp)|✅|✅|✅|
|[valkyrie](https://github.com/samvera/valkyrie)|[![Build Status](https://circleci.com/gh/samvera/valkyrie.svg?style=svg)](https://circleci.com/gh/samvera/valkyrie)|✅|✅|✅|
|[bulkrax](https://github.com/samvera/bulkrax)|[![Build Status](https://github.com/samvera/bulkrax/actions/workflows/test.yml/badge.svg)](https://github.com/samvera/bulkrax/actions/workflows/test.yml)|✅|✅|✅|

#### Under Reorganization
![under reorganization](https://img.shields.io/badge/under-reorg-yellow)

_The following Gems are being merged into other GitHub repositories, but shall remain in active maintenance and released as Gems._

|Gem|CI Status|Ruby 3.2 Support|Ruby 3.1 Support|Rails 7.0 Support|
| --- | --- | --- | --- | --- |
|[active_fedora](https://github.com/samvera/active_fedora)|[![Build Status](https://circleci.com/gh/samvera/active_fedora.svg?style=svg)](https://circleci.com/gh/samvera/active_fedora)|✅|✅|✅|
|[bixby](https://github.com/samvera/bixby)|[![Build Status](https://circleci.com/gh/samvera/bixby.svg?style=svg)](https://circleci.com/gh/samvera/bixby)|✅|✅|✅|
|[hydra-editor](https://github.com/samvera/hydra-editor)|[![Build Status](https://circleci.com/gh/samvera/hydra-editor.svg?style=svg)](https://circleci.com/gh/samvera/hydra-editor)|✅|✅|✅|
|[hydra-file_characterization](https://github.com/samvera/hydra-file_characterization)|[![Build Status](https://circleci.com/gh/samvera/hydra-file_characterization.svg?style=svg)](https://circleci.com/gh/samvera/hydra-file_characterization)|✅|✅|✅|
|[hydra-head](https://github.com/samvera/hydra-head)|[![Build Status](https://circleci.com/gh/samvera/hydra-head.svg?style=svg)](https://circleci.com/gh/samvera/hydra-head)|✅|✅|✅|
|[hydra-pcdm](https://github.com/samvera/hydra-pcdm)|[![Build Status](https://circleci.com/gh/samvera/hydra-pcdm.svg?style=svg)](https://circleci.com/gh/samvera/hydra-pcdm)|✅|✅|✅|
|[hydra-role-management](https://github.com/samvera/hydra-role-management)|[![Build Status](https://circleci.com/gh/samvera/hydra-role-management.svg?style=svg)](https://circleci.com/gh/samvera/hydra-role-management)|✅|✅|✅|
|[hydra-works](https://github.com/samvera/hydra-works)|[![Build Status](https://circleci.com/gh/samvera/hydra-works.svg?style=svg)](https://circleci.com/gh/samvera/hydra-works)|✅|✅|✅|
|[noid-rails](https://github.com/samvera/noid-rails)|[![Build Status](https://circleci.com/gh/samvera/noid-rails.svg?style=svg)](https://circleci.com/gh/samvera/noid-rails)|✅|✅|✅|

#### Awaiting Promotion
![awaiting promotion](https://img.shields.io/badge/awaiting-promotion-blue)

_The following Gems must be promoted from the [Samvera Labs](https://github.com/samvera-labs) in order to support the ongoing maintenance of [Samvera](https://github.com/samvera) Gems._

|Gem|CI Status|Ruby 3.2 Support|Ruby 3.1 Support|Rails 7.0 Support|
| --- | --- | --- | --- | --- |
|[ActiveTriples](https://github.com/samvera-labs/ActiveTriples)|[![Build Status](https://circleci.com/gh/samvera-labs/ActiveTriples.svg?style=svg)](https://circleci.com/gh/samvera-labs/ActiveTriples)|❌|❌|❌|
|[engine_cart](https://github.com/cbeer/engine_cart)|[![Build Status](https://github.com/cbeer/engine_cart/workflows/CI/badge.svg)](https://github.com/cbeer/engine_cart/actions)|✅|✅|✅|
|[huborg](https://github.com/samvera-labs/huborg)|[![Build Status](https://circleci.com/gh/samvera-labs/huborg.svg?style=svg)](https://circleci.com/gh/samvera-labs/huborg)|❌|❌|❌|
|[ldpath](https://github.com/samvera-labs/ldpath)|[![Build Status](https://circleci.com/gh/samvera-labs/ldpath.svg?style=svg)](https://circleci.com/gh/samvera-labs/ldpath)|❌|✅|❌|
|[samvera-labs.github.io](https://github.com/samvera-labs/samvera-labs.github.io)|[![Build Status](https://circleci.com/gh/samvera-labs/samvera-labs.github.io.svg?style=svg)](https://circleci.com/gh/samvera-labs/samvera-labs.github.io)|❌|❌|❌|

#### Prepared for Deprecation
![prepared for deprecation](https://img.shields.io/badge/deprecated-red)

_The following Gems are no longer actively maintained, and awaiting deprecation into the [Samvera Deprecated](https://github.com/samvera-deprecated) Organization._

| Gem | CI Status |
| --- | --- |
|[browse-everything](https://github.com/samvera/browse-everything)|[![Build Status](https://circleci.com/gh/samvera/browse-everything.svg?style=svg)](https://circleci.com/gh/samvera/browse-everything)|

### Samvera JavaScript Projects

|Project|CI Status|
| --- | --- |
|[node-iiif](https://github.com/samvera/node-iiif)|[![Build Status](https://circleci.com/gh/samvera/node-iiif.svg?style=svg)](https://circleci.com/gh/samvera/node-iiif)|
|[serverless-iiif](https://github.com/samvera/serverless-iiif)|[![Build Status](https://circleci.com/gh/samvera/serverless-iiif.svg?style=svg)](https://circleci.com/gh/samvera/serverless-iiif)|
|[samvera.org](https://github.com/samvera/samvera.org)|[![Build Status](https://github.com/samvera/samvera.org/actions/workflows/run-tests.yml/badge.svg)](https://github.com/samvera/samvera.org/actions/workflows/run-tests.yml)|
|[hyku-next](https://github.com/samvera/hyku-next)|[![Build Status](https://github.com/samvera/hyku-next/actions/workflows/playwright.yml/badge.svg)](https://github.com/samvera/hyku-next/actions/workflows/playwright.yml)|
|[avalon-next](https://github.com/samvera/avalon-next)|[![Build Status](https://github.com/samvera/avalon-next/actions/workflows/playwright.yml/badge.svg)](https://github.com/samvera/avalon-next/actions/workflows/playwright.yml)|

### Samvera Infrastructure Projects

#### CircleCI Orbs
|Application|CI Status| 
| --- | --- |
|[samvera-circleci-orb](https://github.com/samvera/samvera-circleci-orb)|[![Build Status](https://circleci.com/gh/samvera/samvera-circleci-orb.svg?style=svg)](https://circleci.com/gh/samvera/samvera-circleci-orb)|

### Samvera Administration
| Project | CI Status |
| --- | --- |
|[maintenance](https://github.com/samvera/maintenance)|[![Build Status](https://circleci.com/gh/samvera/serverless-iiif.svg?style=svg)](https://circleci.com/gh/samvera/serverless-iiif)|

## Maintenance Documentation

- [ORGS](./ORGS.md) - Reference guide for the structure of GitHub Organizations (`samvera`, `samvera-labs`, and `samvera-deprecated`)
- [TEAMS](./TEAMS.md) - Reference guide for the structure of GitHub Teams within the `samvera`, `samvera-labs`, and `samvera-deprecated` Organizations
- [RELEASES](./ruby/RELEASES.md) - Reference guide for the releasing Ruby Gem components maintained by the Samvera Community

## Samvera Project Templates

[README.md](./templates/README.md) - The elements in this template should be in
every repository. Additional elements may be added.

[SUPPORT.md](./templates/SUPPORT.md) - Copy this and replace `{{library}}` with
the repository name. This is linked from the README and has information on how
to create an issue, email the list, and connect to Slack.

[CONTRIBUTING.md](./templates/CONTRIBUTING.md) - Contribution guidelines for
Samvera projects. Should be included. Minimal customization should be necessary.

[CODE_OF_CONDUCT.md](./templates/CODE_OF_CONDUCT.md) - Should be included
verbatim in every Samvera repository. If this is updated, it needs to be
distributed to all Samvera organization repositories.

[LICENSE](./templates/LICENSE) - Should be included in every Samvera
repository. The copyright statements may change as appropriate. This template
was taken from guidelines found on the
[wiki](https://wiki.duraspace.org/display/samvera/Code+Copyright+Statement).

[MAILMAP](./templates/MAILMAP) - A master template for [git mailmap](https://www.git-scm.com/docs/git-check-mailmap).
This template is something to push to all samvera repositories. The goal in
applying a common mailmap is to help understand contributions as people move
and change roles/functions/laptops.

## Ruby Scripts

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
