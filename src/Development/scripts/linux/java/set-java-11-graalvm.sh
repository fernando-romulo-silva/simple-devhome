#!/bin/bash
# go to script dir
back_java=$(pwd)
cd $DEVELOPMENT_HOME/scripts/java

echo "=============================================================================================================================="
echo "Set the environment for Graal JDK 11"

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
. $DEVELOPMENT_HOME/scripts/internal/set-program.sh https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-21.0.0.2/graalvm-ce-java11-linux-amd64-21.0.0.2.tar.gz jdk11-graalvm languages/java JAVA_HOME

# Test it
java -version

echo " "
echo " "

# -----------------------------------------------------------------------------------------------------
# install ant
. $DEVELOPMENT_HOME/scripts/set-ant-1.10.sh

echo " "
echo " "

# -----------------------------------------------------------------------------------------------------
# install maven
. $DEVELOPMENT_HOME/scripts/set-maven-3.6.sh

echo " "
echo " "

# -----------------------------------------------------------------------------------------------------
# install gradle
. $DEVELOPMENT_HOME/scripts/set-gradle-6.8.sh

# go back
cd $back_java

echo "=============================================================================================================================="