SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`

if $DEBUG = true; then
  echo "Loading: PATH's"
fi

# Add dotfiles ../bin to path.
export PATH=$SCRIPTPATH/../bin:${PATH}

# HomeBrew's sbin path
export PATH="/usr/local/sbin:$PATH"

# coreutils
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# gnubin i.e make, etc
export PATH="/usr/local/opt/make/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/make/libexec/gnuman:$MANPATH"

# NVM
source $SCRIPTPATH/../nvm/nvm_paths.sh

# Brew Curl as default
export PATH="/usr/local/opt/curl/bin:$PATH"
