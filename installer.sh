#!/bin/sh

if [ ! -d "/Library/Developer/CommandLineTools" ]; then
  echo "=============================="
  echo "Installing command line tools"
  echo "============================="
  echo "Please follow the prompts to install command line tools and try running this script again"
  xcode-select --install
  exit 0
fi


echo "Command line tools installed"
echo ""
echo "=============================="
echo " Generating SSH KEYS"
echo "=============================="

## TODO make use dynamic input
ssh-keygen -f $HOME/.ssh/id_rsa -t rsa -N ''

open "https://github.com"
echo ""
echo ""
echo "Log into github and copy the following deploy key to your account on Github:"
echo ""
cat ~/.ssh/id_rsa.pub
echo ""
echo ""
echo "Press a key when ready..."
read press
echo "And once more to be sure..."
read press2

echo "Cloning dotfiles repo"
git clone git@github.com:ryardley/dotfiles.git ~/.dotfiles && cd ~/.dotfiles

echo "To install your environment type the following"
echo ""
echo "rake install"
echo ""
