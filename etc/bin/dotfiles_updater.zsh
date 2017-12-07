#!/usr/bin/env zsh

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`

# Only check once a day
DATE_STAMP=`date +%Y%m%d`
if [ ! -f $SCRIPTPATH/../../var/$DATE_STAMP ]; then
  # Create a new date stamp for today
  touch $SCRIPTPATH/../../var/$DATE_STAMP

  echo "********************** RUNNING DOTFILES UPDATER **********************"

  if [ $DIRTY -eq true ]; then
    echo "!! WARNING: uncommited files in local .dotfile repo                  !!"
    echo "!! Please commit and push for daily .dotfiles updater to run         !!"
    echo "***********************************************************************"
    return
  fi

  echo "!!            Running daily check for .dotfiles updates...          !!"

  # Switch into dotfiles
  cd $DOTFILES

  # Check if there a upstream change
  UPDATES=`git fetch --dry-run upstream |& wc -w`

  if [ $UPDATES -gt 0 ]; then
    echo "!!    UPDATES AVAILABLE: Updates available in the upstream repo     !!"
    # TODO: Add updater
    echo "!! Would you like to update now?                                    !!"
  else
    echo "!!                  No .dofiles updates available                  !!"
  fi
  echo "***********************************************************************"
  echo

  # TODO: Add a clean up step. Fixed it for first run with empty dir.
  # Remove old date stamps
  # rm $SCRIPTPATH/../../var/* 2&>1

  cd - > /dev/null
fi
