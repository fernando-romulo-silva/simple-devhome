#!/bin/bash
# go to script dir
back_jetty=$(pwd)
cd $DEVELOPMENT_HOME/scripts/jetty

echo "=============================================================================================================================="
echo "Set the environment for Jetty 12.0 (Java 17+, JEE 10 Web = Servlet 6.0, JSP 3.1, EL 5.0, WebSocket 2.1, Authentication (JASIC) 2.1)"

# -----------------------------------------------------------------------------------------------------
# check the DEVELOPMENT_HOME variable
result=$(../internal/check-develpment-folder.sh)
if [ -z "${result##*error*}" ] ; then
  source ../internal/exit-script.sh $back_jetty $result
  return 0
else
  echo $result
fi

# -----------------------------------------------------------------------------------------------------
# check the JAVA_HOME variable
if [[ -z "${JAVA_HOME}" ]] ; then
  source ../internal/exit-script.sh $back_jetty "error: JAVA_HOME is not configured, please configure it."
  return 0
fi

# -----------------------------------------------------------------------------------------------------
# check Java 17+
JAVA_MAJOR_VERSION=$(java -version 2>&1 | grep -oP 'version "?(1\.)?\K\d+' || true)
if [[ $JAVA_MAJOR_VERSION -lt 17 ]]; then
  source ../internal/exit-script.sh $back_jetty "error: Java 17 or higher is required!"  
  return 0
fi

# -----------------------------------------------------------------------------------------------------
# install jett 12.0
source ../internal/set-program.sh https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-home/12.0.1/jetty-home-12.0.1.zip jetty-12.0 servers/jetty JETTY_HOME

# -----------------------------------------------------------------------------------------------------
# doc jetty
source ../jetty/doc-jetty.sh

# go back
cd $back_jetty

echo "=============================================================================================================================="