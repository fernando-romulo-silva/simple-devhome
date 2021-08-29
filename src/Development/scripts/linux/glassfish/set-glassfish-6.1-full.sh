#!/bin/bash
# go to script dir
back_glass=$(pwd)
cd $DEVELOPMENT_HOME/scripts/glassfish

echo "=============================================================================================================================="
echo "Set the Environment for Glassfish 6.1 Full Profile (JEE 9.1)"

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
# install java 11
source ../java/set-java-11-zulu.sh

# -----------------------------------------------------------------------------------------------------
# install glassfish 6.1
source ../internal/set-program.sh https://download.eclipse.org/ee4j/glassfish/glassfish-6.1.0.zip glassfish-6.1-full servers/glassfish GLASSFISH_HOME

# -----------------------------------------------------------------------------------------------------
# doc glassfish
source ../glassfish/doc-glassfish.sh

# go back
cd $back_glass

echo "=============================================================================================================================="
