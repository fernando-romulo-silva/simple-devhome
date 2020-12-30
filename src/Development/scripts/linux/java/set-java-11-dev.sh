#!/bin/bash
# go to script dir
back=$(pwd)
cd $DEVELOPMENT_HOME/scripts/java

echo "=============================================================================================================================="
echo "Set the environment for JDK 11-Dev (Jdk 11 with Dcevm-Full and HotswapAgent)"

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
# install java
. $DEVELOPMENT_HOME/scripts/internal/set-program.sh https://github.com/TravaOpenJDK/trava-jdk-11-dcevm/releases/download/dcevm-11.0.1+7/java11-openjdk-dcevm-linux.tar.gz jdk11-dev languages/java JAVA_HOME

# Test it
java -version

echo "Don't forget to put the hotswap-agent.properties on your classpath (src/main/reshs)"
echo " "

# go back
cd $back

echo "=============================================================================================================================="