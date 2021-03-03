# Contributing to Rodux
Thanks for considering contributing to Rodux! This guide has a few tips and guidelines to make contributing to the project as easy as possible.

## Bug Reports
Any bugs (or things that look like bugs) can be reported on the [GitHub issue tracker](https://github.com/Roblox/Rodux/issues).

Make sure you check to see if someone has already reported your bug first! Don't fret about it; if we notice a duplicate we'll send you a link to the right issue!

## Feature Requests
If there are any features you think are missing from Rodux, you can post a request in the [GitHub issue tracker](https://github.com/Roblox/Rodux/issues).

Just like bug reports, take a peak at the issue tracker for duplicates before opening a new feature request.

## Working on Rodux
To get started working on Rodux, you'll need:
* Git


Before the tests will work, make sure you have installed all of the repository's foreman and rotriever dependencies. If you haven't cloned it yet, you can use:

Foreman is an un-package manager that retrieves code directly from GitHub repositories. We'll use this to get a Lua package manager and other utilities. The Foreman packages are listed in `foreman.toml`. Foreman uses Rust, so you'll have to install Rust first.

```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
export PATH=$PATH:$HOME/.cargo/bin
cargo install foreman
foreman github-auth <your GitHub API token that you used for npm login above>
foreman install
export PATH=$PATH:~/.foreman/bin/
```

Now you can run the tests, edit code, and contribute! Next we need to install our Lua package dependencies. We do this with a tool called Rotriever, which Foreman just installed for us. The package dependencies are listed in `rotriever.toml`.

```sh
rotrieve install —git-auth <github username>@<github API TOKEN>
```

Next we're going to use Rojo (installed by Foreman above) to compile and package our Lua code into a format that Roblox understands.

```sh
rojo build --output model.rbxmx
```

## Pull Requests
Before starting a pull request, open an issue about the feature or bug. This helps us prevent duplicated and wasted effort. These issues are a great place to ask for help if you run into problems!

Before you submit a new pull request, check:
* Code Style: Match the existing code!
* Changelog: Add an entry to [CHANGELOG.md](CHANGELOG.md)
* Selene: Run [Selene](https://github.com/kampfkerren) on your code, no warnings allowed!

### Code Style
Try to match the existing code style! In short:

* Tabs for indentation
* Double quotes
* One statement per line

### Changelog
Adding an entry to [CHANGELOG.md](CHANGELOG.md) alongside your commit makes it easier for everyone to keep track of what's been changed.

Add a line under the "Current master" heading. When we make a new release, all of those bullet points will be attached to a new version and the "Current master" section will become empty again.

### Selene
We use [Selene](https://github.com/kampfkerren/selene) for static analysis of Lua on all of our projects.

From the command line, just run `selene src` to check the Rodux source.

You should get it working on your system, and then get a plugin for the editor you use. There are plugins available for most popular editors!

### Tests
When submitting a bug fix, create a test that verifies the broken behavior and that the bug fix works. This helps us avoid regressions!

When submitting a new feature, add tests for all functionality.
