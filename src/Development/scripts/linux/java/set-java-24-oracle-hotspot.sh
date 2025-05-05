#!/bin/bash
# go to script dir
back_java=$(pwd)
cd $DEVELOPMENT_HOME/scripts/java

echo "=============================================================================================================================="
echo "Set the environment for Oracle Hotspot JDK 24"

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
source ../internal/set-program.sh https://download.oracle.com/java/24/latest/jdk-24_linux-x64_bin.tar.gz jdk24-oracle-hotspot languages/java JAVA_HOME

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
source ../set-maven-3.9.sh

echo " "
echo " "

# -----------------------------------------------------------------------------------------------------
# install gradle
source ../set-gradle-8.14.sh

# go back
cd $back_java

echo "=============================================================================================================================="
