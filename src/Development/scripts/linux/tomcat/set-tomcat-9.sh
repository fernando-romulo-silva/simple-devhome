#!/bin/bash
# go to script dir
back_tom=$(pwd)
cd $DEVELOPMENT_HOME/scripts/tomcat

echo "=============================================================================================================================="
echo "Set the Environment for Tomcat 9.0 (JEE 8 Web = Servlet 4.0, JSP 2.3, EL 3.0, WebSocket 1.1, Authentication (JASIC) 1.1)"

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
source ../set-java-8-zulu.sh

# -----------------------------------------------------------------------------------------------------
# install tomcat 9
source ../internal/set-program.sh https://downloads.apache.org/tomcat/tomcat-9/v9.0.45/bin/apache-tomcat-9.0.45.tar.gz apache-tomcat-9.0 servers/apache-tomcat CATALINA_HOME

# -----------------------------------------------------------------------------------------------------
# doc tomcat
source ../tomcat/doc-tomcat.sh

# go back
cd $back_tom

echo "=============================================================================================================================="