#!/bin/bash
# go to script dir
back=$(pwd)
cd $DEVELOPMENT_HOME/scripts/java

echo "=============================================================================================================================="
echo "Set the environment for Zulu JDK 8 with DCEVM-Light and HotswapAgent"

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
. $DEVELOPMENT_HOME/scripts/internal/set-program.sh https://cdn.azul.com/zulu/bin/zulu8.31.0.1-jdk8.0.181-linux_x64.tar.gz jdk8-zulu-dcevm languages/java JAVA_HOME

# Test it
java -version

echo " "
echo " "

# -----------------------------------------------------------------------------------------------------
# install DCEVM
. $DEVELOPMENT_HOME/scripts/internal/set-program.sh https://github.com/dcevm/dcevm/releases/download/light-jdk8u181/DCEVM-8u181-installer.jar DCEVM-light-8 tools/DCEVM

# backup the libjvm.so file
mv -vn $JAVA_HOME/jre/lib/amd64/server/libjvm.so $JAVA_HOME/jre/lib/amd64/server/libjvm.so.backup 

# extract the DCEVM's libjvm.so to jdk
unzip -q -p $DEVELOPMENT_HOME/tools/DCEVM/DCEVM-light-8/DCEVM-light-8.jar linux_amd64_compiler2/product/libjvm.so > $JAVA_HOME/jre/lib/amd64/server/libjvm.so

# Test it
java -version

echo " "
echo " "

# -----------------------------------------------------------------------------------------------------
# install HotswapAgent
. $DEVELOPMENT_HOME/scripts/internal/set-program.sh https://github.com/HotswapProjects/HotswapAgent/releases/download/RELEASE-1.3.0/hotswap-agent-1.3.0.jar hotswap-agent-1.3.0 tools/HotswapAgent

echo "To use hotswap agent, launch your application server with options: -javaagent:'path_to_jar_file'/hotswap-agent-1.3.0.jar"
echo "Don't forget to put the hotswap-agent.properties on your classpath (src/main/reshs)"
echo " "

# go back
cd $back

echo "=============================================================================================================================="