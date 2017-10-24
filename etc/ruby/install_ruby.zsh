#!/usr/bin/env zsh

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`

source $SCRIPTPATH/ruby.zshrc

chruby ruby-2.4

if [ $(which ruby ) = /usr/bin/ruby ]; then
  ruby-install ruby-2.4
else
  echo "Ruby is installed"
fi

chruby | sed 's/\*//' > ~/.ruby-version
