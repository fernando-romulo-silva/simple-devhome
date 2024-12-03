#!/bin/bash
# go to script dir
back_groovy=$(pwd)
cd $DEVELOPMENT_HOME/scripts/groovy

echo "=============================================================================================================================="
echo "Set the environment for Groovy 4"

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
# check the JAVA_HOME variable
if [[ -z "${JAVA_HOME}" ]] ; then
  source ../internal/exit-script.sh $back_ant "error: JAVA_HOME is not configured, please configure it."
  return 0
fi

# -----------------------------------------------------------------------------------------------------
# check Java 8+
JAVA_MAJOR_VERSION=$(java -version 2>&1 | grep -oP 'version "?(1\.)?\K\d+' || true)
if [[ $JAVA_MAJOR_VERSION -lt 8 ]]; then
  source ../internal/exit-script.sh $back_ant "error: Java 8 or higher is required!"
  return 0
fi

# -----------------------------------------------------------------------------------------------------
# install java
source ../internal/set-program.sh https://groovy.jfrog.io/artifactory/dist-release-local/groovy-zips/apache-groovy-binary-4.0.24.zip groovy4 languages/groovy GROOVY_HOME

# Test it
groovy -version

# go back
cd $back_groovy

echo "=============================================================================================================================="