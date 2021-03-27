#!/bin/bash
# go to script dir
back_wild=$(pwd)
cd $DEVELOPMENT_HOME/scripts/wildfly

echo "=============================================================================================================================="
echo "Set the environment for Wildfly-15"

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
. $DEVELOPMENT_HOME/scripts/java/set-java-11-zulu.sh

# -----------------------------------------------------------------------------------------------------
# install wildfly-15
. $DEVELOPMENT_HOME/scripts/internal/set-program.sh https://download.jboss.org/wildfly/15.0.1.Final/wildfly-15.0.1.Final.zip wildfly-15.0 servers/wildfly WILDFLY_HOME

# -----------------------------------------------------------------------------------------------------
# doc Wildfly
. $DEVELOPMENT_HOME/scripts/wildfly/doc-wildfly.sh

# go back
cd $back_wild

echo "=============================================================================================================================="