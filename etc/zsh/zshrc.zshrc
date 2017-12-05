#!/usr/bin/env zsh
export DEBUG=false

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`

if $DEBUG = true; then
  echo "DEBUG:" $DEBUG
  echo "SCRIPT:" $SCRIPT
  echo "SCRIPTPATH:" $SCRIPTPATH
fi

if [ -f ~/.localrc ]; then
  source ~/.localrc
fi

source $SCRIPTPATH/zshrc_macosx.zsh

source $SCRIPTPATH/zshrc_options.zsh

source $SCRIPTPATH/../shell/sources.zsh

if $DEBUG = true; then
  echo "Loaded: ZSH Shell: ($SHELL: $ZSH_VERSION)!"
fi

source $SCRIPTPATH/../bin/dotfiles_status.zsh
source $SCRIPTPATH/../bin/dotfiles_update.zsh
