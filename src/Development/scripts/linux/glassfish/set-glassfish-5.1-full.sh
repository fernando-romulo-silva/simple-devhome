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
  source ../internal/exit-script.sh $back_glass
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
# check Java 8
JAVA_MAJOR_VERSION=$(java -version 2>&1 | grep -oP 'version "?(1\.)?\K\d+' || true)
if [[ $JAVA_MAJOR_VERSION != 8 ]]; then
  source ../internal/exit-script.sh $back_glass "error: Java 8 is required!"
  return 0
fi

# -----------------------------------------------------------------------------------------------------
# install glassfish 5.1
source ../internal/set-program.sh https://repo1.maven.org/maven2/org/glassfish/main/distributions/glassfish/5.1.0/glassfish-5.1.0.zip glassfish-5.1-full servers/glassfish GLASSFISH_HOME

# -----------------------------------------------------------------------------------------------------
# doc glassfish
source ../glassfish/doc-glassfish.sh

# go back
cd $back_glass

echo "=============================================================================================================================="
