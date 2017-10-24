#!/usr/bin/env zsh

brew install -v zsh
brew install -v zsh-autosuggestions
brew install -v zsh-completions
brew install -v zsh-lovers
brew install -v zsh-navigation-tools
brew install -v zsh-syntax-highlighting
brew install -v zsh-history-substring-search
brew install -v liquidprompt
brew install -v z

sudo dscl . -create /Users/$USER UserShell `which zsh`
echo "Shell set to: `dscl . -read /Users/$USER UserShell`"
