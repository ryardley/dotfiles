#!/usr/bin/env zsh

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`

brew install ruby-install
brew install chruby

# Downloads to ~/src
# Install's to ~/.rubies
ruby-install ruby

source $SCRIPTPATH/ruby.zshrc
echo $(chruby) > ~/.ruby-version
