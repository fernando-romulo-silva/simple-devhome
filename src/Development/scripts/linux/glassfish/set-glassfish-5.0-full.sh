#!/bin/bash
# go to script dir
back_glass=$(pwd)
cd $DEVELOPMENT_HOME/scripts/glassfish

echo "=============================================================================================================================="
echo "Set the environment for Glassfish 5.0 Full Profile"

# -----------------------------------------------------------------------------------------------------
# check the DEVELOPMENT_HOME variable
result=$(../internal/check-develpment-folder.sh)
if [ -z "${result##*error*}" ] ; then
  echo $result
  exit 1
else
  echo $result
fi

# -----------------------------------------------------------------------------------------------------
# install java 8
. $DEVELOPMENT_HOME/scripts/java/set-java-8-zulu.sh

# -----------------------------------------------------------------------------------------------------
# install glassfish 5.0
. $DEVELOPMENT_HOME/scripts/internal/set-program.sh http://download.java.net/glassfish/5.0/release/javaee8-ri.zip glassfish-5.0 servers/glassfish GLASSFISH_HOME

# -----------------------------------------------------------------------------------------------------
# doc glassfish
. $DEVELOPMENT_HOME/scripts/glassfish/doc-glassfish.sh

# go back
cd $back_glass

echo "=============================================================================================================================="