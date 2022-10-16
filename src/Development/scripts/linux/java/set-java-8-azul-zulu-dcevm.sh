#!/bin/bash
# go to script dir
back=$(pwd)
cd $DEVELOPMENT_HOME/scripts/java

echo "=============================================================================================================================="
echo "Set the environment for Azul Zulu JDK 8 with DCEVM-Light and HotswapAgent"

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
source ../internal/set-program.sh https://cdn.azul.com/zulu/bin/zulu8.31.0.1-jdk8.0.181-linux_x64.tar.gz jdk8-azul-zulu-dcevm languages/java JAVA_HOME

# -------------------
# install DCEVM
source ../internal/set-program.sh https://github.com/dcevm/dcevm/releases/download/light-jdk8u181/DCEVM-8u181-installer.jar DCEVM-light-8 tools/DCEVM

# backup the libjvm.so file
mv -vn $JAVA_HOME/jre/lib/amd64/server/libjvm.so $JAVA_HOME/jre/lib/amd64/server/libjvm.so.backup 

# extract the DCEVM's libjvm.so to jdk
unzip -q -p $DEVELOPMENT_HOME/tools/DCEVM/DCEVM-light-8/DCEVM-light-8.jar linux_amd64_compiler2/product/libjvm.so > $JAVA_HOME/jre/lib/amd64/server/libjvm.so

# --------------------
# install HotswapAgent
source ../internal/set-program.sh https://github.com/HotswapProjects/HotswapAgent/releases/download/RELEASE-1.3.0/hotswap-agent-1.3.0.jar hotswap-agent-1.3.0 tools/HotswapAgent


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
source ../set-gradle-5.1.sh

echo " "
echo "To use hotswap agent, launch your application with options: -javaagent:$DEVELOPMENT_HOME/tools/HotswapAgent/hotswap-agent-1.3.0/hotswap-agent-1.3.0.jar"
echo "Don't forget to put the hotswap-agent.properties on your classpath (src/main/resource)"

# go back
cd $back

echo "=============================================================================================================================="