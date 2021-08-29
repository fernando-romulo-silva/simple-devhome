#!/bin/bash
# go to script dir
back_glass=$(pwd)
cd $DEVELOPMENT_HOME/scripts/glassfish

echo "=============================================================================================================================="
echo "Set the Environment for Glassfish 5.1 Full Profile (JEE 8)"

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
source ../java/set-java-8-zulu.sh

# -----------------------------------------------------------------------------------------------------
# install glassfish 5.1
source ../internal/set-program.sh https://repo1.maven.org/maven2/org/glassfish/main/distributions/glassfish/5.1.0/glassfish-5.1.0.zip glassfish-5.1-full servers/glassfish GLASSFISH_HOME

# -----------------------------------------------------------------------------------------------------
# doc glassfish
source ../glassfish/doc-glassfish.sh

# go back
cd $back_glass

echo "=============================================================================================================================="
