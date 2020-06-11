# Core Component Maintenance Working Group

This repository holds templates and guidelines to support the maintenance of
libraries in the [Samvera](https://github.com/samvera) Github organization.

## Templates

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

## Rake Tasks

There exist rake tasks that can be used to propogate some of these templates.

## Scripts

* [./script/grant_revoke_gem_authority.rb](./script/grant_revoke_gem_authority.rb)
  is a convenience script to synchronize authorship of Samvera
  rubygems.
