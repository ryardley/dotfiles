#!/usr/bin/env zsh

# Check if loacl repo is clean
STATUS=`git status -s`

if [ $STATUS ]; then
  echo "!! WARNING: You have uncommited files in your loacl .dotfiles repo. !!"
fi
