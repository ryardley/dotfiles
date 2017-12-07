#!/usr/bin/env zsh

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`

if $DEBUG = true; then
  echo "Loading: PATH's"
fi

# Add dotfiles ../bin to path.
export PATH=$SCRIPTPATH/../bin:${PATH}
export DOTFILES=`echo $SCRIPTPATH | sed 's/\/etc\/shell//'`
