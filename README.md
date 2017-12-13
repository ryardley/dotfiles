# Dotfile/Environment Management System

## Why this exists

This project exists to help in the process of environment management of dotfiles config files for ZSH, Ruby, Python, Node, VIM, etc. As well as the installation and setup of extra osx command line and gui apps such as docter, iterm2, etc via the homebrew, brewfile, brewCask and BrewMas system.

This project is designed around the idea of being able to have drop in components that automatically run the special files to install and setup whatever is require for that component.

The primary goal of this project is to be able to setup OSX dev systems and linux servers in a zero-to-hero, quick and consistent way.

**Please note this project is very much a work in progress and is only really just getting started. Currently this projects is not ready for public consumption!**

## High Level Project Goals

- Simple easy to use, understand and extend
- OSX and Linux compatible
- Install via standard systems commands/scripts/dev env
- Remote/Quick starter install option
- Installation detects for OSX Dev System or Linux servers.
- Modular drop-in type setup
- Update feature / Sync feature

## Reference Projects:

In the making of this project I have used a combination of the following resources:

- <https://github.com/holman/dotfiles>

- <https://github.com/BlackMagicMushroom/paracord>

- <https://github.com/mathiasbynens/dotfiles> -

- <https://github.com/webpro/dotfiles>

- <https://github.com/ryanb/dotfiles>

## Reference articles:

- <https://github.com/webpro/awesome-dotfiles> -

# Getting started

To get started using this project on a fresh install of osx you will need to fork the repository, install xcode command line tools and clone the repository to your local system as follows:

```
xcode-select --install #Click yes to download and install the tools, then continue
git clone git@github.com:[YOUR_GIT_USERNAME]/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
```

## Usage

Once installed on your local system you will need to be in the root of the repository. All commands are executed via the Ruby rake task system.

**Please review before installing**

1. This system works in a non-destructive way as much as possible. If any of the erb files that get processed or symlinked in the users home directory already exist this system will continue without making any changes. The only other dotfile that is modified is the `~/.zshrc` file components `*.zshrc` files are added to be sourced on shell startup.

2. Many homebrew files will be installed as part of the default setup, so do make sure you review the `./etc/homebrew/brew*` to understand what is going to be installed as part of the base setup here.

3. As part of this setup there is a component `./etc/macosx/install_macosx.zsh` that makes a lot of changes to the default setting of osx to optimise the system as much as possible. It is highly recommended that you review this file in detail before running as it may have unexpected efforts.

### Installation

To install on a fresh system run the following command. This will ask you questions where required about any setup tasks that need input. Such as the installing of extra BrewCask or BrewMas apps.

`rake install`

To install all BrewCask and BrewMas apps without any questions run the following task:

`rake install:all`

To install only shell/command line apps and components run the following task:

`rake install:shell`

## Components

As stated, this project is designed around the idea of being able to have drop in components that automatically run the given special files to install and setup whatever is require for that component.

A components is anything like node and its eco-system, Ruby and its eco-system, Zsh and its eco-system, etc.

All components are located in the `./etc` directory within the repository. Have a look in here for working examples.

The component installation and setup works via the use of special files postfixes as follows:

- **install_[component_name].[rb|zsh]** is used to run any commands required to install the given component and any other part of its eco-system
- **[component_name].zshrc** is used to store any shell configurations that are required. These files are then added to the users `~/.zshrc` to be sourced on every shell startup
- **[component_name].symlink** is used to create a symlink to the users home directory in the form of: `~/.[component_name]`
- **[component_name].erb** is used to create template file that can then use environment variables such as GIT_USERNAME, etc. Refer to the `./etc/localrc/localrc-example` for more information.

## Configurations

### `./config.yml`

To configure what components get installed and in what order please see the `config.yml` file. This file is split in up my system types. However note that only OSX is currently working and supported. Same tuned to linux support soon.

### `./localrc`

As part of the installation a `~/.localrc` is created once off. This file is designed to keep personal type of environment variables such as usernames, tokens, etc that can then be used in
