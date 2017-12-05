#!/usr/bin/env zsh

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`

# Only check once a day
DATE_STAMP=`date +%Y%m%d`
if [ ! -f $SCRIPTPATH/../../var/$DATE_STAMP ]; then
  echo "Running daily check for .dotfiles upstream updates..."
  # Check if there a upstream change
  UPSTREAM=`git fetch --dry-run`
  if [ $UPSTREAM ]; then
    echo "!! UPDATES AVAILABLE: There are updates available in the upstream repo !!"
  else
    echo '!! .dofiles in sync with upstream !!'
  fi
fi

touch $SCRIPTPATH/../../var/$DATE_STAMP


