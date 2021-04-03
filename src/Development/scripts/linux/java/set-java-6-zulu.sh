#!/bin/bash
# go to script dir
back_java=$(pwd)
cd $DEVELOPMENT_HOME/scripts/java

echo "=============================================================================================================================="
echo "Set the environment for Zulu JDK 6"

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
. $DEVELOPMENT_HOME/scripts/internal/set-program.sh https://cdn.azul.com/zulu/bin/zulu6.22.0.3-jdk6.0.119-linux_x64.tar.gz jdk6-zulu languages/java JAVA_HOME

# Test it
java -version

echo " "
echo " "

# -----------------------------------------------------------------------------------------------------
# install ant
. $DEVELOPMENT_HOME/scripts/set-ant-1.9.sh

echo " "
echo " "

# -----------------------------------------------------------------------------------------------------
# install maven
. $DEVELOPMENT_HOME/scripts/set-maven-3.2.sh

echo " "
echo " "

# -----------------------------------------------------------------------------------------------------
# install gradle
. $DEVELOPMENT_HOME/scripts/set-gradle-2.14.sh

# go back
cd $back_java

echo "=============================================================================================================================="