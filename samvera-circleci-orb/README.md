# Samvera CircleCI Orb

Code: [![Samvera Core Component](https://img.shields.io/badge/samvera-core--component-brightgreen)](https://github.com/samvera/maintenance#samvera-core-components)
[![Build Status](https://circleci.com/gh/samvera/samvera-circleci-orb.svg?style=svg)](https://circleci.com/gh/samvera/samvera-circleci-orb)
[![Version](https://badges.circleci.com/orbs/samvera/circleci-orb.svg)](https://circleci.com/developer/orbs/orb/samvera/circleci-orb)

Docs: [![Contribution Guidelines](http://img.shields.io/badge/CONTRIBUTING-Guidelines-blue.svg)](./CONTRIBUTING.md)
[![Apache 2.0 License](http://img.shields.io/badge/APACHE2-license-blue.svg)](./LICENSE)

Community Support: [![Samvera Community Slack](https://img.shields.io/badge/samvera-slack-blueviolet)](http://slack.samvera.org/)

# What is the CircleCI Orb?

The Samvera CircleCI Orb is meant to make testing Samvera and Samvera-based projects easier. The orb provides executors that include common Samvera dependencies, and commands to help set up and run your tests.

More information about orbs in general is available in [CircleCI's docs](https://circleci.com/docs/),
and up-to-date documentation about the Samvera orb exists on [the orb's CircleCI page](https://circleci.com/orbs/registry/orb/samvera/circleci-orb)

## Help

The Samvera community is here to help. Please see our [support guide](./SUPPORT.md).

## Using the orb

Since using the orb depends on Circle's configuration API, this section will attempt to point you to the latest
documentation rather than copying docs that may become outdated quickly.

If you are not yet using CircleCI, please start with their [introduction documentation](https://circleci.com/docs/2.0/first-steps/)

The canonical documentation for setting up the orb is in the [Quick Start Guide](https://circleci.com/orbs/registry/orb/samvera/circleci-orb)
on the orb's CircleCI page.

Once you have finished with the Quick Start, the executors and commands will be available for use in your
config. The executors are named for the dependencies they include (ruby, ruby\_fcrepo\_solr, etc.), and the
commands are named and documented to avoid surprises.

Circle has general information about [executors](https://circleci.com/docs/2.0/executor-intro/#section=configuration),
and [commands](https://circleci.com/docs/2.0/using-orbs/#commands) that may be useful as well.

## Best practices

The executors allow you to set parameters for the dependencies they use. For instance, you could have in
your parameters

```
solr_version:
    type: string
    default: '7-slim'
```

or in your build matrix:

```
ruby_type: 'ruby'
```

Different dependencies have different parameters, but all of them allow you to specify a version. You should do
this! The orb is permissive in the versions it allows, and may surprise you by upgrading when you least expect
it.

Be prepared! Control your destiny! Specify versions!

## Releasing new versions

The orb will automatically publish two dev versions with every build that passes checks.
The first is always `dev:alpha`. Since this is not a unique identifier, this version may be quickly
overwritten. The other is `dev:<SHA1>`, where the SHA1 is the first seven characters of the commit hash
that was built.
Orb versions that begin with `dev:` can be overwritten by anyone, and only exist for 90 days.

Additionally, publishing dev and production versions of the orb can be done manually:

1. Install the CircleCI Client -
   [https://circleci.com/docs/2.0/local-cli/#installation](https://circleci.com/docs/2.0/local-cli/#installation)
2. `circleci setup` (You'll need an API key)
3. `circleci config pack src > src/orb.yml`
4. `circleci orb validate src/orb.yml`
5. `circleci orb publish src/orb.yml samvera/circleci-orb@dev:alpha`
6. If Ready for permanent version bump: `circleci orb publish promote
   samvera/circleci-orb@dev:alpha [major/minor/patch]`

## Acknowledgments

This software has been developed by and is brought to you by the Samvera community.  Learn more at the [Samvera website](http://samvera.org/).

![Samvera Logo](https://samvera.atlassian.net/wiki/download/attachments/1682341933/Samvera_logo_horizontal_200.png?api=v2)

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/samvera/samvera-circleci-orb/.

If you're working on PR for this project, create a feature branch off of `main`.

This repository follows the [Samvera Community Code of Conduct](https://samvera.atlassian.net/wiki/spaces/samvera/pages/405212316/Code+of+Conduct) and [language recommendations](https://github.com/samvera/maintenance/blob/master/templates/CONTRIBUTING.md#language). Please ***do not*** create a branch called `master` for this repository or as part of your pull request; the branch will either need to be removed or renamed before it can be considered for inclusion in the code base and history of this repository.
