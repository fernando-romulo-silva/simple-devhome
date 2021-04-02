#!/bin/bash
# go to script dir
back=$(pwd)
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
. $DEVELOPMENT_HOME/scripts/internal/set-program.sh https://downloads.apache.org//ant/binaries/apache-ant-1.9.15-bin.zip apache-ant-1.9.15 tools/apache-ant ANT_HOME

# Test it
ant -version

echo " "
echo " "

# -----------------------------------------------------------------------------------------------------
# install maven
. $DEVELOPMENT_HOME/scripts/internal/set-program.sh https://archive.apache.org/dist/maven/maven-3/3.2.5/binaries/apache-maven-3.2.5-bin.zip apache-maven-3.2.5 tools/apache-maven M2_HOME

# Test it
mvn -version

echo " "
echo " "

# -----------------------------------------------------------------------------------------------------
# install gradle
. $DEVELOPMENT_HOME/scripts/internal/set-program.sh https://services.gradle.org/distributions/gradle-2.14.1-bin.zip gradle-2.14.1 tools/gradle GRADLE_HOME

# Test it
gradle -v

# go back
cd $back

echo "=============================================================================================================================="