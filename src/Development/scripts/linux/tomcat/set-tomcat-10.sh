#!/bin/bash
# go to script dir
back_tom=$(pwd)
cd $DEVELOPMENT_HOME/scripts/tomcat

echo "=============================================================================================================================="
echo "Set the Environment for Tomcat 10.0 (JEE 9 Web = Servlet 5.0, JSP 3.0, EL 4.0, WebSocket 2.0, Authentication (JASIC) 2.0)"

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
source ../set-java-11-zulu.sh

# -----------------------------------------------------------------------------------------------------
# install tomcat 10
source ../internal/set-program.sh https://mirror.nbtelecom.com.br/apache/tomcat/tomcat-10/v10.0.6/bin/apache-tomcat-10.0.6.tar.gz apache-tomcat-10.0 servers/apache-tomcat CATALINA_HOME

# -----------------------------------------------------------------------------------------------------
# doc tomcat
source ../tomcat/doc-tomcat.sh

# go back
cd $back_tom

echo "=============================================================================================================================="