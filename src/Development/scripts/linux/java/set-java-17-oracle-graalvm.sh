#!/bin/bash
# go to script dir
back_java=$(pwd)
cd $DEVELOPMENT_HOME/scripts/java

echo "=============================================================================================================================="
echo "Set the environment for Oracle GraalVM JDK 17"

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
source ../internal/set-program.sh https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-22.2.0/graalvm-ce-java17-linux-amd64-22.2.0.tar.gz jdk17-oracle-graalvm languages/java JAVA_HOME

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
source ../set-gradle-7.5.sh

# go back
cd $back_java

echo "=============================================================================================================================="
