#!/usr/bin/env zsh

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`

cd $DOTFILES
# Check if loacl repo is clean
STATUS=`git status -s`

if [ $STATUS ]; then
  echo "********************** RUNNING LOCAL STATUS CHECKER ******************"
  echo "!! WARNING: You have uncommited files in your local .dotfiles repo. !!"
  echo "!!   Please commit and contribute your changes back to upstream     !!"
  echo "!!                            Thank you                             !!"
  echo "**********************************************************************"
  echo

  # Create a dirty marker
  export DIRTY=true
else
  # Remove the dirty marker
  export DIRTY=false
fi
cd - > /dev/null

