# HomeBrew's sbin path
export PATH="/usr/local/sbin:$PATH"

# coreutils
PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"

# gnubin i.e make, etc
export PATH="/usr/local/opt/make/libexec/gnubin:$PATH"
export MANPATH="/usr/local/opt/make/libexec/gnuman:$MANPATH"

# Brew Curl as default
export PATH="/usr/local/opt/curl/bin:$PATH"
