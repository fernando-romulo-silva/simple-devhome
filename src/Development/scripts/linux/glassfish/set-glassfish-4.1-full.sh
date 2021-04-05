#!/bin/bash
# go to script dir
back_glass=$(pwd)
cd $DEVELOPMENT_HOME/scripts/glassfish

echo "=============================================================================================================================="
echo "Set the Environment for Glassfish 4.1 Full Profile (JEE 7)"

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
# install java 7
. $DEVELOPMENT_HOME/scripts/java/set-java-7-zulu.sh

# -----------------------------------------------------------------------------------------------------
# install glassfish 4.1
. $DEVELOPMENT_HOME/scripts/internal/set-program.sh https://repo1.maven.org/maven2/org/glassfish/main/distributions/glassfish/4.1.2/glassfish-4.1.2.zip glassfish-4.1-full servers/glassfish GLASSFISH_HOME

# -----------------------------------------------------------------------------------------------------
# doc glassfish
. $DEVELOPMENT_HOME/scripts/glassfish/doc-glassfish.sh

# go back
cd $back_glass

echo "=============================================================================================================================="
