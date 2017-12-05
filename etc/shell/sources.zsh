#!/usr/bin/env zsh

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`

# Setup Env's
source $SCRIPTPATH/env.zsh

# Setup PATH's
source $SCRIPTPATH/paths.zsh

# Setup Alias
source $SCRIPTPATH/aliases.zsh

# Setup proxy settings
source $SCRIPTPATH/proxy.zsh

# Setup Colours
source $SCRIPTPATH/colours.zsh

# Setup functions
source $SCRIPTPATH/functions.zsh
