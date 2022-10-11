#!/bin/bash
# go to script dir
back_wild=$(pwd)
cd $DEVELOPMENT_HOME/scripts/wildfly

echo "=============================================================================================================================="
echo "Set the Environment for Wildfly 26.1 Full Profile (JEE 8)"

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
# check Java 11+
JAVA_MAJOR_VERSION=$(java -version 2>&1 | grep -oP 'version "?(1\.)?\K\d+' || true)
if [[ $JAVA_MAJOR_VERSION -lt 11 ]]; then
  echo "Java 11 or higher is required!"
  exit 1
fi

# -----------------------------------------------------------------------------------------------------
# install wildfly-26.1
source ../internal/set-program.sh https://github.com/wildfly/wildfly/releases/download/26.1.2.Final/wildfly-26.1.2.Final.zip wildfly-26.1-full servers/wildfly WILDFLY_HOME

# -----------------------------------------------------------------------------------------------------
# doc Wildfly
source ../wildfly/doc-wildfly.sh

# go back
cd $back_wild

echo "=============================================================================================================================="