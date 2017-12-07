#!/usr/bin/env zsh

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`

cd $DOTFILES
# Check if loacl repo is clean
STATUS=`git status -s`

if [ $STATUS ]; then
  echo "********************** RUNNING LOCAL STATUS CHECKER ******************"
  echo "!!  WARNING: You have unsynced files in your local .dotfiles repo.  !!"
  echo "!!   Please commit and contribute your changes back to upstream     !!"
  echo "!!                            Thank you                             !!"
  echo "**********************************************************************"
  echo

  # Create a dirty marker
  export DIRTY=true
  return
else
  # Not dirty
  export DIRTY=false
fi

PUSHED=`git status | grep "Your branch is ahead of"`

if [ $PUSHED ]; then
  echo "***************************** GIT PUSH *******************************"
  echo "!!      WARNING: You have yet to push your local changes up.        !!"
  echo "!!     Please push and contribute your changes back to upstream     !!"
  echo "!!                            Thank you                             !!"
  echo "**********************************************************************"
  echo
fi




cd - > /dev/null

