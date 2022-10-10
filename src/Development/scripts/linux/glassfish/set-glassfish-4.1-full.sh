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
# check the JAVA_HOME variable
if [[ -z "${JAVA_HOME}" ]] ; then
  echo "Java home, JAVA_HOME, is not configured, please configure it."
  exit 1
fi

# -----------------------------------------------------------------------------------------------------
# check Java 7
JAVA_MAJOR_VERSION=$(java -version 2>&1 | grep -oP 'version "?(1\.)?\K\d+' || true)
if [[ $JAVA_MAJOR_VERSION != 1.7 ]]; then
  echo "Java 7 is required!"
  exit 1
fi

# -----------------------------------------------------------------------------------------------------
# install glassfish 4.1
source ../internal/set-program.sh https://repo1.maven.org/maven2/org/glassfish/main/distributions/glassfish/4.1.2/glassfish-4.1.2.zip glassfish-4.1-full servers/glassfish GLASSFISH_HOME

# -----------------------------------------------------------------------------------------------------
# doc glassfish
source ../glassfish/doc-glassfish.sh

# go back
cd $back_glass

echo "=============================================================================================================================="
