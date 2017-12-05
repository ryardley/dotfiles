#!/usr/bin/env zsh
UPSTREAM=`git remote | grep upstream`

if [ ! $UPSTREAM ]; then
  git remote add upstream git@github.com:MettaData/dotfiles.git
  echo "Added upstream repo locally"
fi
