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
# check Java
JAVA_MAJOR_VERSION=$(java -version 2>&1 | grep -oP 'version "?(1\.)?\K\d+' || true)
if [[ $JAVA_MAJOR_VERSION != 8 ]]; then
  source ../internal/exit-script.sh $back_tom "error: Java 8 is required!"
  return 0
fi

# -----------------------------------------------------------------------------------------------------
# install tomcat 9
source ../internal/set-program.sh https://downloads.apache.org/tomcat/tomcat-9/v9.0.45/bin/apache-tomcat-9.0.45.tar.gz apache-tomcat-9.0 servers/apache-tomcat CATALINA_HOME

# -----------------------------------------------------------------------------------------------------
# doc tomcat
source ../tomcat/doc-tomcat.sh

# go back
cd $back_tom

echo "=============================================================================================================================="