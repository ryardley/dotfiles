#!/usr/bin/env zsh

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`

# if [ $DIRTY ]; then
#   echo "WARNING: Once all changes are commited then daily updates will be run"
#   echo "***********************************************************************"
#   return
# fi

# Only check once a day
DATE_STAMP=`date +%Y%m%d`
if [ ! -f $SCRIPTPATH/../../var/$DATE_STAMP ]; then
  echo "********************** RUNNING DOTFILES UPDATER **********************"
  echo "!!            Running daily check for .dotfiles updates...          !!"

  # Switch into dotfiles
  cd $DOTFILES

  # Check if there a upstream change
  UPDATES=`git fetch --dry-run upstream |& wc -w`

  if [ $UPDATES -gt 0 ]; then
    echo "!!    UPDATES AVAILABLE: Updates available in the upstream repo     !!"
    # TODO: Add updater
  else
    echo "!!                  No .dofiles updates available                  !!"
  fi
  echo "***********************************************************************"
  echo

  # Remove old date stamps
  rm $SCRIPTPATH/../../var/*

  # Create a new date stamp for today
  # touch $SCRIPTPATH/../../var/$DATE_STAMP
  cd - > /dev/null
fi
