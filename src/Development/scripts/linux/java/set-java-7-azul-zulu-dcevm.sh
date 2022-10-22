#!/bin/bash
# go to script dir
back_java=$(pwd)
cd $DEVELOPMENT_HOME/scripts/java

echo "=============================================================================================================================="
echo "Set the environment for Azul Zulu JDK 7 with DCEVM-Full and HotswapAgent"

# -----------------------------------------------------------------------------------------------------
# check the DEVELOPMENT_HOME variable
result=$(../internal/check-develpment-folder.sh)
if [ -z "${result##*error*}" ] ; then
  source ../internal/exit-script.sh $back_java $result
  return 0
else
  echo $result
fi

# -----------------------------------------------------------------------------------------------------
# install java
source ../internal/set-program.sh https://cdn.azul.com/zulu/bin/zulu1.7.0_79-7.9.0.2-x86lx64.zip jdk7-azul-zulu-dcevm languages/java JAVA_HOME

# --------------------
# install DCEVM
source ../internal/set-program.sh https://github.com/dcevm/dcevm/releases/download/full-jdk7u79+8/DCEVM-full-7u79-installer.jar DCEVM-full-7 tools/DCEVM

# backup the libjvm.so file
mv -vn $JAVA_HOME/jre/lib/amd64/server/libjvm.so $JAVA_HOME/jre/lib/amd64/server/libjvm.so.backup 

# extract the DCEVM's jvm.so to jdk
unzip -q -p $DEVELOPMENT_HOME/tools/DCEVM/DCEVM-full-7/DCEVM-full-7.jar linux_amd64_compiler2/product/libjvm.so > $JAVA_HOME/jre/lib/amd64/server/libjvm.so

# --------------------
# install HotswapAgent
source ../internal/set-program.sh https://github.com/HotswapProjects/HotswapAgent/releases/download/RELEASE-1.3.0/hotswap-agent-1.3.0.jar hotswap-agent-1.3.0 tools/HotswapAgent

# Test it
java -version

echo " "
echo " "

# -----------------------------------------------------------------------------------------------------
# install ant
source ../set-ant-1.9.sh

echo " "
echo " "

# -----------------------------------------------------------------------------------------------------
# install maven
source ../set-maven-3.3.sh

echo " "
echo " "

# -----------------------------------------------------------------------------------------------------
# install gradle
source ../set-gradle-3.5.sh

echo " "
echo "To use hotswap agent, launch your application with options: -javaagent:$DEVELOPMENT_HOME/tools/HotswapAgent/hotswap-agent-1.3.0/hotswap-agent-1.3.0.jar"
echo "Don't forget to put the hotswap-agent.properties on your classpath (src/main/resource)"

# go back_java
cd $back_java

echo "=============================================================================================================================="