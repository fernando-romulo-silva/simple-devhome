#!/bin/bash
# go to script dir
back_tom=$(pwd)
cd $DEVELOPMENT_HOME/scripts/tomcat

echo "=============================================================================================================================="
echo "Set the Environment for Tomcat 10.0 (Java 11+, JEE 9 Web = Servlet 5.0, JSP 3.0, EL 4.0, WebSocket 2.0, Authentication (JASIC) 2.0)"

# -----------------------------------------------------------------------------------------------------
# check the DEVELOPMENT_HOME variable
result=$(../internal/check-develpment-folder.sh)
if [ -z "${result##*error*}" ] ; then
  source ../internal/exit-script.sh $back_tom $result
  return 0
else
  echo $result
fi

# -----------------------------------------------------------------------------------------------------
# check the JAVA_HOME variable
if [[ -z "${JAVA_HOME}" ]] ; then
  source ../internal/exit-script.sh $back_tom "error: JAVA_HOME is not configured, please configure it."
  return 0
fi

# -----------------------------------------------------------------------------------------------------
# check Java 11+
JAVA_MAJOR_VERSION=$(java -version 2>&1 | grep -oP 'version "?(1\.)?\K\d+' || true)
if [[ $JAVA_MAJOR_VERSION -lt 11 ]]; then
  source ../internal/exit-script.sh $back_tom "error: Java 11 or higher is required!"
  return 0
fi

# -----------------------------------------------------------------------------------------------------
# install tomcat 10
source ../internal/set-program.sh https://mirror.nbtelecom.com.br/apache/tomcat/tomcat-10/v10.0.6/bin/apache-tomcat-10.0.6.tar.gz apache-tomcat-10.0 servers/apache-tomcat CATALINA_HOME

# -----------------------------------------------------------------------------------------------------
# doc tomcat
source ../tomcat/doc-tomcat.sh

# go back
cd $back_tom

echo "=============================================================================================================================="