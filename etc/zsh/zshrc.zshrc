#!/usr/bin/env zsh
export DEBUG=false

SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"



# GRC
if $DEBUG = true; then
  echo "Loading: GRC"
fi
if [ -f /usr/local/etc/grc.bashrc ]; then
  source /usr/local/etc/grc.bashrc
fi

# zsh-autosuggestions
if $DEBUG = true; then
  echo "Loading: zsh-autosuggestions"
fi
if [ -f /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# zsh-completions
if $DEBUG = true; then
  echo "Loading: zsh-completions"
fi
if [ -f /usr/local/share/zsh-completions ]; then
  fpath=(/usr/local/share/zsh-completions $fpath)
fi

# zsh-navigation-tools
if $DEBUG = true; then
  echo "Loading: zsh-navigation-tools"
fi
if [ -f /usr/local/share/zsh-navigation-tools/zsh-navigation-tools.plugin.zsh ]; then
  source /usr/local/share/zsh-navigation-tools/zsh-navigation-tools.plugin.zsh
fi

# zsh-syntax-highlighting
if $DEBUG = true; then
  echo "Loading: zsh-syntax-highlighting"
fi
if [ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# z
if $DEBUG = true; then
  echo "Loading: z"
fi
if [ -f /usr/local/etc/profile.d/z.sh ]; then
  source /usr/local/etc/profile.d/z.sh
fi

# zsh-history-substring-search
if $DEBUG = true; then
  echo "Loading: zsh-history-substring-search"
fi
if [ -f /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh ]; then
  source /usr/local/share/zsh-history-substring-search/zsh-history-substring-search.zsh
fi

# direnv
if $DEBUG = true; then
  echo "Loading: direnv"
fi
if [ `which direnv` ]; then
  eval "$(direnv hook zsh)"
fi

# Liquid Prompt
if $DEBUG = true; then
  echo "Loading: Liquid Prompt"
fi
if [ -f /usr/local/share/liquidprompt ]; then
   source /usr/local/share/liquidprompt
fi

source $SCRIPTPATH/../shell/sources.sh

if $DEBUG = true; then
  echo "Loaded: ZSH Shell: ($SHELL: $ZSH_VERSION)!"
fi

echo "Welcome $FIRSTNAME, your environment has loaded."
