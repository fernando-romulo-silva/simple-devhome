#!/bin/bash
# go to script dir
back=$(pwd)
cd $DEVELOPMENT_HOME/scripts/java

echo "=============================================================================================================================="
echo "Set the environment for Zulu JDK 16"

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
. $DEVELOPMENT_HOME/scripts/internal/set-program.sh https://cdn.azul.com/zulu/bin/zulu16.28.11-ca-jdk16.0.0-linux_x64.tar.gz jdk16-zulu languages/java JAVA_HOME

# Test it
java -version

echo " "
echo " "

# -----------------------------------------------------------------------------------------------------
# install ant
. $DEVELOPMENT_HOME/scripts/internal/set-program.sh https://downloads.apache.org//ant/binaries/apache-ant-1.10.9-bin.zip apache-ant-1.10.9 tools/apache-ant ANT_HOME

# Test it
ant -version

echo " "
echo " "

# -----------------------------------------------------------------------------------------------------
# install maven
. $DEVELOPMENT_HOME/scripts/internal/set-program.sh http://ftp.unicamp.br/pub/apache/maven/maven-3/3.6.3/binaries/apache-maven-3.6.3-bin.zip apache-maven-3.6.3 tools/apache-maven M2_HOME

# Test it
mvn -version

echo " "
echo " "

# -----------------------------------------------------------------------------------------------------
# install gradle
. $DEVELOPMENT_HOME/scripts/internal/set-program.sh https://services.gradle.org/distributions/gradle-6.8.3-bin.zip gradle-6.8.3 tools/gradle GRADLE_HOME

# Test it
gradle -v

# go back
cd $back

echo "=============================================================================================================================="