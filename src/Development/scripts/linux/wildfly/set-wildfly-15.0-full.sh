#!/bin/bash
# go to script dir
back_wild=$(pwd)
cd $DEVELOPMENT_HOME/scripts/wildfly

echo "=============================================================================================================================="
echo "Set the Environment for Wildfly 15.0 Full Profile (Java 11+, JEE 8)"

# -----------------------------------------------------------------------------------------------------
# check the DEVELOPMENT_HOME variable
result=$(../internal/check-develpment-folder.sh)
if [ -z "${result##*error*}" ] ; then
  source ../internal/exit-script.sh $back_wild $result
  return 0
else
  echo $result
fi

# -----------------------------------------------------------------------------------------------------
# check the JAVA_HOME variable
if [[ -z "${JAVA_HOME}" ]] ; then
  source ../internal/exit-script.sh $back_wild "error: JAVA_HOME is not configured, please configure it."
  return 0
fi

# -----------------------------------------------------------------------------------------------------
# check Java 11+
JAVA_MAJOR_VERSION=$(java -version 2>&1 | grep -oP 'version "?(1\.)?\K\d+' || true)
if [[ $JAVA_MAJOR_VERSION -lt 11 ]]; then
  source ../internal/exit-script.sh $back_wild "error: Java 11 or higher is required!"
  return 0
fi

# -----------------------------------------------------------------------------------------------------
# install wildfly-15.0
source ../internal/set-program.sh https://download.jboss.org/wildfly/15.0.1.Final/wildfly-15.0.1.Final.zip wildfly-15.0-full servers/wildfly WILDFLY_HOME

# -----------------------------------------------------------------------------------------------------
# doc Wildfly
source ../wildfly/doc-wildfly.sh

# go back
cd $back_wild

echo "=============================================================================================================================="