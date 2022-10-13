#!/bin/bash
# go to script dir
back=$(pwd)
cd $DEVELOPMENT_HOME/scripts/java

echo "=============================================================================================================================="
echo "Set the environment for Azul Zulu JDK 7 with DCEVM-Full and HotswapAgent"

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
source ../internal/set-program.sh http://cdn-files.evildayz.com/mirror/java/jdk_7u79/jdk-7u79-linux-x64.tar.gz jdk7-azul-zulu-dcevm languages/java JAVA_HOME

# Test it
java -version

echo " "
echo " "

# -----------------------------------------------------------------------------------------------------
# install DCEVM
source ../internal/set-program.sh https://github.com/dcevm/dcevm/releases/download/full-jdk7u79+8/DCEVM-full-7u79-installer.jar DCEVM-full-7 tools/DCEVM

# backup the libjvm.so file
mv -vn $JAVA_HOME/jre/lib/amd64/server/libjvm.so $JAVA_HOME/jre/lib/amd64/server/libjvm.so.backup 

# extract the DCEVM's jvm.so to jdk
unzip -q -p $DEVELOPMENT_HOME/tools/DCEVM/DCEVM-full-7/DCEVM-full-7.jar linux_amd64_compiler2/product/libjvm.so > $JAVA_HOME/jre/lib/amd64/server/libjvm.so

echo " "
echo " "

# -----------------------------------------------------------------------------------------------------
# install HotswapAgent
source ../internal/set-program.sh https://github.com/HotswapProjects/HotswapAgent/releases/download/RELEASE-1.3.0/hotswap-agent-1.3.0.jar hotswap-agent-1.3.0 tools/HotswapAgent

echo "To use hotswap agent, launch your application server with options: -javaagent:'path_to_jar_file'/hotswap-agent-1.3.0.jar"
echo "Don't forget to put the hotswap-agent.properties on your classpath (src/main/reshs)"
echo " "

# Test it
java -version

# go back
cd $back

echo "=============================================================================================================================="