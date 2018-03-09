# #!/usr/bin/env zsh

# if $DEBUG = true; then
#   echo "Loading: ALIASE's"
# fi

# # ls
# alias ls="ls --color"
# alias ll="ls -lFG"
# alias l=ll
# alias la="ls -alFG"

# # Git
# alias gst='git status'
# alias gl='git pull'
# alias gp='git push'
# alias gd='git diff'
# alias gc='git commit -v'
# alias gca='git commit -v -a'
# alias gb='git branch'
# alias gba='git branch -a'
# alias gf='git fetch --all'

# alias p='ping -c 10 google.com.au'

# #alias speedtest10='time wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip'
# #alias speedtest100='time wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test100.zip'

# # Testing shell load speeds
# alias tshell='for i in $(seq 1 10); do /usr/bin/time zsh -i -c exit; done'
# alias dshell='zsh -i -c -x exit'

# ## Networking

# # Mac address changes
# alias gmac="openssl rand -hex 6 | sed 's/\(..\)/\1:/g; s/.$//'"
# alias cmac="sudo ifconfig en0 ether `gmac`"

# # IP addresses
# alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
# alias localip="ipconfig getifaddr en1"

# # Show active network interfaces
# alias ifactive="ifconfig | pcregrep -M -o '^[^\t:]+:([^\n]|\n\t)*status: active'"

# # Flush Directory Service cache
# alias flush="dscacheutil -flushcache && killall -HUP mDNSResponder"

# # Open posts
# alias ports_lsof="sudo lsof -PiTCP -sTCP:LISTEN"
# alias ports_netstat='netstat -ap tcp | grep -i "listen"'

# ## Finder
# # Show/hide hidden files in Finder
# alias show="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
# alias hide="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"

# # Copy pub key to clipboard
# alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to clipboard.'"

# # Brew
# alias bs="brew search"
# alias binfo="brew info"
# alias bi="brew install"
# alias bu="brew update"
# alias bup="brew upgrade"

# # Python
# alias pip="pip3"

# # Vagrant
# alias v="vagrant global-status"
# alias vup="vagrant up"
# alias vhalt="vagrant halt"
# alias vssh="vagrant ssh"
# alias vreload="vagrant reload"
# alias vrebuild="vagrant destroy --force && vagrant up"

# # Navigation
# alias ..="cd .."
# alias ....="cd ../.."
# alias ......="cd ../../.."
# alias ........="cd ../../../.."

# # Always enable colored `grep` output
# # Note: `GREP_OPTIONS="--color=auto"` is deprecated, hence the alias usage.
# alias grep='grep --color=auto'
# alias fgrep='fgrep --color=auto'
# alias egrep='egrep --color=auto'

# # Get week number
# alias week='date +%V'

# # Print each PATH entry on a separate line
# alias path='echo -e ${PATH//:/\\n}'

# # Osx desktop stuff
# alias desktop_image_location_show='defaults write com.apple.dock desktop-picture-show-debug-text -bool TRUE;killall Dock'
# alias desktop_image_location_hide='defaults delete com.apple.dock desktop-picture-show-debug-text;killall Dock'

# # Vim
# alias vi='vim'
# alias v='vim'
# alias e='vim'
