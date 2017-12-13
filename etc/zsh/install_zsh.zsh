#!/usr/bin/env zsh

sudo dscl . -create /Users/$USER UserShell `which zsh`
echo "Set Shell to: `dscl . -read /Users/$USER UserShell`"
