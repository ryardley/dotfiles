#!/usr/bin/env sh
UPSTREAM=`git remote | grep upstream`

if [ ! $UPSTREAM ]; then
  git remote add upstream git@github.com:MettaData/dotfiles.git
  echo "Added upstream repo locally"
fi

#say "Please enter your super user password?"
# Ask for the administrator password upfront
sudo -v

# source ./etc/dotfiles/sudo_keep-alive.zsh &

# initialise zshrc
touch ~/.zshrc
