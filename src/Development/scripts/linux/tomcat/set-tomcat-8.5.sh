#!/bin/bash
# go to script dir
back_tom=$(pwd)
cd $DEVELOPMENT_HOME/scripts/tomcat

echo "=============================================================================================================================="
echo "Set the Environment for Tomcat 8.5 (JEE 7 Web = Servlet 3.1, JSP 2.3, EL 3.0, WebSocket 1.1, Authentication (JASIC) 1.1)"

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
source ../set-java-7-zulu.sh

# -----------------------------------------------------------------------------------------------------
# install tomcat 8.5
source ../internal/set-program.sh https://downloads.apache.org/tomcat/tomcat-8/v8.5.64/bin/apache-tomcat-8.5.64.zip apache-tomcat-8.5 servers/apache-tomcat CATALINA_HOME

# -----------------------------------------------------------------------------------------------------
# doc tomcat
source ../tomcat/doc-tomcat.sh

# go back
cd $back_tom

echo "=============================================================================================================================="