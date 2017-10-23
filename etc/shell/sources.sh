SCRIPT=`realpath $0`
SCRIPTPATH=`dirname $SCRIPT`

# Setup Env's
source $SCRIPTPATH/env.sh

# Setup PATH's
source $SCRIPTPATH/paths.sh

# Setup Alias
source $SCRIPTPATH/aliases.sh

# Setup prompt
# source $SCRIPTPATH/prompt.sh

# Setup proxy settings
source $SCRIPTPATH/proxy.sh

# Setup Colours
source $SCRIPTPATH/colours.sh

# Setup functions
source $SCRIPTPATH/functions.sh

# NVM
source $SCRIPTPATH/../nvm/nvm.sh
