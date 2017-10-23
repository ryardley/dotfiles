if $DEBUG = true; then
  echo "Loading: NVM"
fi
# NVM
# if [ -f /usr/local/opt/nvm/nvm.sh ]; then
#   source /usr/local/opt/nvm/nvm.sh
# fi

# Total Hack's to get around prefromance issue with nvm on shell startup.
nvm() {
  if [ -f /usr/local/opt/nvm/nvm.sh ]; then
      source /usr/local/opt/nvm/nvm.sh
  fi
}
