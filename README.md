# My Dotfile Management System

## Why this exists

This project exists to help me in the management of my dotfiles config across OSX dev systems and linux server systems.

**Please note this project is very much a work in progress and is only really just getting started. Currently this projects is not ready for public consumption!**

## Why I really need this

- Get new systems up and running quickly and consistently for myself and other developers that work with me.
- To install on either osx dev systems or linux servers and to have my opinionated configurations follow me around.

## High Level Project Goals

- Simple and easy to use, understand and extend
- OSX and Linux compatible
- Install via standard systems commands/scripts/dev env
- Remote/Quick starter install option
- Installation detects for OSX Dev System or Linux servers.
- Modular drop-in type setup
- Update feature

# Reference Projects:

- <https://github.com/holman/dotfiles>

- <https://github.com/BlackMagicMushroom/paracord>

- <https://github.com/mathiasbynens/dotfiles> -

- <https://github.com/webpro/dotfiles>

- <https://github.com/ryanb/dotfiles>

# Reference articles:

- <https://github.com/webpro/awesome-dotfiles> -

## Roadmap

# User cases

1. Users set's up a new osx dev machine from an existing dofiles project.
2. Update an existing dotfiles setup with the upstream repo

## Proposed usage

1. Remote web installer

2. git fork > git clone > rake bootstrap

# Components

After the base system is setup, everything is then setup around the idea of components. I.e node and its eco-system is a component, Ruby and its eco-system a component, Zsh and its eco-system is a component, etc.
