#!/bin/bash
# go to script dir
back=$(pwd)
cd $DEVELOPMENT_HOME/scripts/tomcat

echo "=============================================================================================================================="
echo "Set the Environment for Tomcat 8.5"

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
. $DEVELOPMENT_HOME/scripts/java/set-java-7.sh

# -----------------------------------------------------------------------------------------------------
# install tomcat 8.5
. $DEVELOPMENT_HOME/scripts/internal/set-program.sh http://mirror.nbtelecom.com.br/apache/tomcat/tomcat-8/v8.5.37/bin/apache-tomcat-8.5.37.zip apache-tomcat-8.5 servers/apache-tomcat CATALINA_HOME

# -----------------------------------------------------------------------------------------------------
# doc tomcat
. $DEVELOPMENT_HOME/scripts/tomcat/doc-tomcat.sh

# go back
cd $back

echo "=============================================================================================================================="