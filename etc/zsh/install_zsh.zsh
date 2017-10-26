#!/usr/bin/env zsh

sudo dscl . -create /Users/$USER UserShell `which zsh`
echo "Shell set to: `dscl . -read /Users/$USER UserShell`"
