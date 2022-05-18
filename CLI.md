# Component Maintenance Interest Group
## Command-Line Interface (CLI) Utility

### Getting Started

1. Get a personal access token from GitHub (https://github.com/settings/tokens) with the following scopes enabled:
  * `public_repo`
  * `read:org`
  * `user:email`
1. Set an ENV variable named `GITHUB_SAMVERA_TOKEN` containing your token

The CLI commands may then be listed using the following:

```bash
$ bundle exec thor list
```

...yielding:

```bash
samvera
-------
thor samvera:org:add_owners     # Ensure that all members of the administrator GitHub Team are Gem Owners for RubyGems entries
thor samvera:org:admins         # list members of the GitHub administrative Team
thor samvera:org:contributors   # list members of the GitHub administrative Team
thor samvera:org:remove_owners  # Ensure that all Gem Owners for RubyGems entries which are *not* members of the administrator ...
thor samvera:org:repositories   # list Samvera repositories
```

### Queries

One may retrieve the current GitHub administrators using the following:

```bash
$ bundle exec thor samvera:org:admins
```

One may retrieve the current GitHub contributors using the following:

```bash
$ bundle exec thor samvera:org:contributors
```

One may also retrieve the current GitHub repositories managing Ruby Gem projects using the following:

```bash
$ bundle exec thor samvera:org:repositories
```

### Gem Management

As an administrator, one may grant ownership privileges for RubyGems entries to all GitHub contributors using the following:

```bash
$ bundle exec thor samvera:org:add_owners
```

As an administrator, one may revoke ownership privileges for RubyGems entries to owners who are neither GitHub contributors nor GitHub administrators using the following:

```bash
$ bundle exec thor samvera:org:remove_owners
```

