if $DEBUG = true; then
  echo "Loading: LS_COLOUR"
fi

# After much searching I found this: Ref: https://geoff.greer.fm/lscolors/
export LS_COLORS="rs=0:di=37:ln=35:so=32:pi=33:ex=31:bd=34;46:cd=34;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
export LS_OPTIONS=‘–color=auto’
