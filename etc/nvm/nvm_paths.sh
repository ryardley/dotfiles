# NVM
export NVM_DIR="$HOME/.nvm"

# For project/local node modules installs
export PATH="node_modules/.bin:$PATH"

# yarn global bin path
# export PATH="$PATH:`yarn global bin`"

# Yarn global install bin path
export PATH="${HOME}/.config/yarn/global/node_modules/.bin${PATH:+:${PATH}}"

# Add to node path for require() statements with node console.
export NODE_PATH="${HOME}/.config/yarn/global/node_modules"
