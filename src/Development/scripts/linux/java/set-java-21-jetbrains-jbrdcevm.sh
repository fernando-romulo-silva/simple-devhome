#!/bin/bash
# go to script dir
back_java=$(pwd)
cd $DEVELOPMENT_HOME/scripts/java

echo "============================================================================================="
echo "Set JetBrains JBR JDK 21 (Open Jdk 21 with Dcevm-Full and HotswapAgent)"

# --------------------------------------------------------------------
# check the DEVELOPMENT_HOME variable
result=$(../internal/check-develpment-folder.sh)
if [ -z "${result##*error*}" ] ; then
  source ../internal/exit-script.sh $back_java $result
  return 0
else
  echo $result
fi

# --------------------------------------------------------------------
# install java
source ../internal/set-program.sh https://cache-redirector.jetbrains.com/intellij-jbr/jbr_jcef-21.0.2-linux-x64-b346.3.tar.gz jdk21-jetbrains-jbr-dcevm languages/java JAVA_HOME

# --------------------
# install HotswapAgent
source ../internal/set-program.sh https://github.com/HotswapProjects/HotswapAgent/releases/download/RELEASE-1.4.1/hotswap-agent-1.4.1.jar hotswap-agent-1.4.1 tools/HotswapAgent

mkdir -p $JAVA_HOME/lib/hotswap

cp $DEVELOPMENT_HOME/tools/HotswapAgent/hotswap-agent-1.4.1/hotswap-agent-1.4.1.jar $JAVA_HOME/lib/hotswap/hotswap-agent.jar

# Test it
java -version

echo " "
echo " "

# --------------------------------------------------------------------
# install ant
source ../set-ant-1.10.sh

echo " "
echo " "

# --------------------------------------------------------------------
# install maven
source ../set-maven-3.9.sh

echo " "
echo " "

# --------------------------------------------------------------------
# install gradle
source ../set-gradle-9.1.sh

echo " "
echo "Don't forget to run your application with additional VM arguments '-XX:+AllowEnhancedClassRedefinition -XX:HotswapAgent=fatjar'"

# go back
cd $back_java

echo "============================================================================================="
