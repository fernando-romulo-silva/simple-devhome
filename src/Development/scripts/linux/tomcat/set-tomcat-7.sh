#!/bin/bash
# go to script dir
back_tom=$(pwd)
cd $DEVELOPMENT_HOME/scripts/tomcat

echo "=============================================================================================================================="
echo "Set the Environment for Tomcat 7.0 (JEE 6 Web = Servlet 3.0, JSP 2.2, EL 2.2, WebSocket 1.1, Authentication (JASIC) N/A)"

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
# check Java
JAVA_MAJOR_VERSION=$(java -version 2>&1 | grep -oP 'version "?(1\.)?\K\d+' || true)
if [[ $JAVA_MAJOR_VERSION != 1.6 ]]; then
  echo "Java 6 is required!"
  exit 1
fi

# -----------------------------------------------------------------------------------------------------
# install tomcat 7
source ../internal/set-program.sh http://mirror.nbtelecom.com.br/apache/tomcat/tomcat-7/v7.0.92/bin/apache-tomcat-7.0.92.zip apache-tomcat-7.0 servers/apache-tomcat CATALINA_HOME

# -----------------------------------------------------------------------------------------------------
# doc tomcat
source ../tomcat/doc-tomcat.sh

# go back
cd $back_tom

echo "=============================================================================================================================="