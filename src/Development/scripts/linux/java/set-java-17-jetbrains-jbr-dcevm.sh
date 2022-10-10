#!/bin/bash
# go to script dir
back_java=$(pwd)
cd $DEVELOPMENT_HOME/scripts/java

echo "=============================================================================================================================="
echo "Set the environment for JetBrains JBR JDK 17 (Open Jdk 17 with Dcevm-Full and HotswapAgent)"

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
source ../internal/set-program.sh https://cache-redirector.jetbrains.com/intellij-jbr/jbr_dcevm-17_0_1-linux-x64-b164.8.tar.gz jdk17-jetbrains-jbr-dcevm languages/java JAVA_HOME


# -----------------------------------------------------------------------------------------------------
# install HotswapAgent
source ../internal/set-program.sh https://github.com/HotswapProjects/HotswapAgent/releases/download/RELEASE-1.4.1/hotswap-agent-1.4.1.jar hotswap-agent-1.4.1 tools/HotswapAgent

mkdir -p $JAVA_HOME/lib/hotswap

cp $DEVELOPMENT_HOME/tools/HotswapAgent/hotswap-agent-1.4.1/hotswap-agent-1.4.1.jar $JAVA_HOME/lib/hotswap/hotswap-agent.jar

# Test it
java -version

echo " "
echo " "

# -----------------------------------------------------------------------------------------------------
# install ant
source ../set-ant-1.10.sh

echo " "
echo " "

# -----------------------------------------------------------------------------------------------------
# install maven
source ../set-maven-3.8.sh

echo " "
echo " "

# -----------------------------------------------------------------------------------------------------
# install gradle
source ../set-gradle-7.3.sh

# go back
cd $back_java

echo "=============================================================================================================================="
