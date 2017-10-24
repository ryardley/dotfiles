#!/usr/bin/env zsh
export DEBUG=true

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`

if [ -f ~/.localrc ]; then
  source ~/.localrc
fi

source $SCRIPTPATH/../shell/sources.sh

source $SCRIPTPATH/zshrc_macosx

source $SCRIPTPATH/zshrc_settings

if $DEBUG = true; then
  echo "Loaded: ZSH Shell: ($SHELL: $ZSH_VERSION)!"
fi

echo "Welcome $FIRSTNAME, your environment has loaded."
