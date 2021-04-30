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
. $DEVELOPMENT_HOME/scripts/set-java-11-zulu.sh

# -----------------------------------------------------------------------------------------------------
# install tomcat 10
. $DEVELOPMENT_HOME/scripts/internal/set-program.sh https://downloads.apache.org/tomcat/tomcat-10/v10.0.5/bin/apache-tomcat-10.0.5.tar.gz apache-tomcat-10.0 servers/apache-tomcat CATALINA_HOME

# -----------------------------------------------------------------------------------------------------
# doc tomcat
. $DEVELOPMENT_HOME/scripts/tomcat/doc-tomcat.sh

# go back
cd $back_tom

echo "=============================================================================================================================="