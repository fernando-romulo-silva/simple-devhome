#!/bin/bash
# go to script dir
back_maven=$(pwd)
cd $DEVELOPMENT_HOME/scripts/java

echo "=============================================================================================================================="
echo "Set the environment for Maven 3.2 (JDK 6)"

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
# check the JAVA_HOME variable
if [[ -z "${JAVA_HOME}" ]] ; then
  echo "Java home, JAVA_HOME, is not configured, please configure it."
  exit 1
fi

# -----------------------------------------------------------------------------------------------------
# check Java 6
JAVA_MAJOR_VERSION=$(java -version 2>&1 | grep -oP 'version "?(1\.)?\K\d+' || true)
if [[ $JAVA_MAJOR_VERSION != 1.6 ]]; then
  echo "Java 6 is required!"
  exit 1
fi

# -----------------------------------------------------------------------------------------------------
# install maven
source ../internal/set-program.sh https://archive.apache.org/dist/maven/maven-3/3.2.5/binaries/apache-maven-3.2.5-bin.zip apache-maven-3.2.5 tools/apache-maven M2_HOME

# Test it
mvn -version

# go back
cd $back_maven

echo "=============================================================================================================================="