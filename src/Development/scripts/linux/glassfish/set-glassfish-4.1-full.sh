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
  source ../internal/exit-script.sh $back_glass $result
  return 0
else
  echo $result
fi

# -----------------------------------------------------------------------------------------------------
# check the JAVA_HOME variable
if [[ -z "${JAVA_HOME}" ]] ; then
  source ../internal/exit-script.sh $back_glass "error: JAVA_HOME is not configured, please configure it."
  return 0
fi

# -----------------------------------------------------------------------------------------------------
# check Java 7
JAVA_MAJOR_VERSION=$(java -version 2>&1 | grep -oP 'version "?(1\.)?\K\d+' || true)
if [[ $JAVA_MAJOR_VERSION != 7 ]]; then
  source ../internal/exit-script.sh $back_glass "error: Java 7 is required!"
  return 0
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
