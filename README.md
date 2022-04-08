# Component Maintenance Interest Group

This repository holds templates and guidelines to support the maintenance of projects in the [Samvera](https://github.com/samvera) Github organization.

## Samvera Core Components

Samvera Core Components are defined as the following:

> The primary Samvera code repository contains the Samvera community’s current consensus on what we are using, maintaining, and recommending. Ideally, this repository only contains code modules that are being actively used and maintained.

_Please reference [A Guide for the Samvera Community](https://samvera.github.io/core_components.html) for further information._

Currently, there are eighteen Samvera Core Components maintained by the community:

1. [active_fedora](https://github.com/samvera/active_fedora)
1. [bixby](https://github.com/samvera/bixby)
1. [browse-everything](https://github.com/samvera/browse-everything)
1. [hydra-derivatives](https://github.com/samvera/hydra-derivatives)
1. [hydra-editor](https://github.com/samvera/hydra-editor)
1. [hydra-file_characterization](https://github.com/samvera/hydra-file_characterization)
1. [hydra-head](https://github.com/samvera/hydra-head)
1. [hydra-pcdm](https://github.com/samvera/hydra-pcdm)
1. [hydra-role-management](https://github.com/samvera/hydra-role-management)
1. [hydra-works](https://github.com/samvera/hydra-works)
1. [iiif_manifest](https://github.com/samvera/iiif_manifest)
1. [ldp](https://github.com/samvera/ldp)
1. [noid-rails](https://github.com/samvera/noid-rails)
1. [questioning_authority](https://github.com/samvera/questioning_authority)
1. [rubydora](https://github.com/samvera/rubydora)
1. [samvera.github.io](https://github.com/samvera/samvera.github.io)
1. [samvera-circleci-orb](https://github.com/samvera/samvera-circleci-orb)
1. [valkyrie](https://github.com/samvera/valkyrie)

## Samvera Component Templates

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
