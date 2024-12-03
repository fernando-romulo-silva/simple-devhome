#!/bin/bash
# go to script dir
back_node=$(pwd)
cd $DEVELOPMENT_HOME/scripts/javascript

echo "=============================================================================================================================="
echo "Set the environment for Javascript node JS 14"

# -----------------------------------------------------------------------------------------------------
# check the DEVELOPMENT_HOME variable
result=$(../internal/check-develpment-folder.sh)
if [ -z "${result##*error*}" ] ; then
  source ../internal/exit-script.sh $back_groovy $result
  return 0
else
  echo $result
fi

# -----------------------------------------------------------------------------------------------------
# install java
#source ../internal/set-program.sh https://nodejs.org/dist/v22.11.0/node-v22.11.0-linux-x64.tar.xz node22.11 languages/javascript/node NODE_HOME
# wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
# https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-22-04

# Test it
node --version

# go back
cd $back_node

echo "=============================================================================================================================="