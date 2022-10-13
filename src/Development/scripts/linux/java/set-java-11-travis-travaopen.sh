#!/bin/bash
# go to script dir
back_java=$(pwd)
cd $DEVELOPMENT_HOME/scripts/java

echo "=============================================================================================================================="
echo "Set the environment for Travis Trava JDK 11 (Open Jdk 11 with Dcevm-Full and HotswapAgent)"

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
# install java
source ../internal/set-program.sh https://github.com/TravaOpenJDK/trava-jdk-11-dcevm/releases/download/dcevm-11.0.1+7/java11-openjdk-dcevm-linux.tar.gz jdk11-travis-travaopen languages/java JAVA_HOME

# Test it
java -version

echo "Don't forget to put the hotswap-agent.properties on your classpath (src/main/resources)"
echo " "

# go back
cd $back_java

echo "=============================================================================================================================="