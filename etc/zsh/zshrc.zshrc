#!/usr/bin/env zsh
export DEBUG=false

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`

# Setup local system configs
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi

# Setup osx zsh settings
source $SCRIPTPATH/zshrc_macosx.zsh

# Setup general system interpendant zsh options
source $SCRIPTPATH/zshrc_options.zsh

# Source all the good stuff
source $SCRIPTPATH/../shell/sources.zsh

# Run banner output
source $SCRIPTPATH/../shell/banner.zsh

# Run git status and updater
source $SCRIPTPATH/../bin/dotfiles_status.zsh
source $SCRIPTPATH/../bin/dotfiles_updater.zsh

