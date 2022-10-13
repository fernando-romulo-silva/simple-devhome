#!/bin/bash
# go to script dir
back_jetty=$(pwd)
cd $DEVELOPMENT_HOME/scripts/jetty

echo "=============================================================================================================================="
echo "Set the environment for Jetty 9.4 (JEE 7 Web = Servlet 3.1, JSP 2.3, EL 3.0, WebSocket 1.1, Authentication (JASIC) 1.1)"

# -----------------------------------------------------------------------------------------------------
# check the DEVELOPMENT_HOME variable
result=$(../internal/check-develpment-folder.sh)
if [ -z "${result##*error*}" ] ; then
  echo $result
  return 0
else
  echo $result
fi

# -----------------------------------------------------------------------------------------------------
# check Java 8+
JAVA_MAJOR_VERSION=$(java -version 2>&1 | grep -oP 'version "?(1\.)?\K\d+' || true)
if [[ $JAVA_MAJOR_VERSION -lt 8 ]]; then
  echo "Java 8 or higher is required!"
  return 0
fi

# -----------------------------------------------------------------------------------------------------
# install jett 9.4
source ../internal/set-program.sh https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-distribution/9.4.14.v20181114/jetty-distribution-9.4.14.v20181114.zip jetty-9.4 servers/jetty JETTY_HOME

# -----------------------------------------------------------------------------------------------------
# doc jetty
source ../jetty/doc-jetty.sh

# go back
cd $back_jetty

echo "=============================================================================================================================="