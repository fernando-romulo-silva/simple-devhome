#!/bin/bash
# go to script dir
back_jetty=$(pwd)
cd $DEVELOPMENT_HOME/scripts/jetty

echo "=============================================================================================================================="
echo "Set the environment for Jetty 9.4"

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
. $DEVELOPMENT_HOME/scripts/java/set-java-8-zulu.sh

# -----------------------------------------------------------------------------------------------------
# install jett 9.4
. $DEVELOPMENT_HOME/scripts/internal/set-program.sh https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-distribution/9.4.14.v20181114/jetty-distribution-9.4.14.v20181114.zip jetty-9.4 servers/jetty JETTY_HOME

# -----------------------------------------------------------------------------------------------------
# doc jetty
. $DEVELOPMENT_HOME/scripts/jetty/doc-jetty.sh

# go back
cd $back_jetty

echo "=============================================================================================================================="