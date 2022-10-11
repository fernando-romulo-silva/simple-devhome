#!/bin/bash
# go to script dir
back_maven=$(pwd)
cd $DEVELOPMENT_HOME/scripts/java

echo "=============================================================================================================================="
echo "Set the environment for Maven 3.8 (JDK 8+)"

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
# check Java 8+
JAVA_MAJOR_VERSION=$(java -version 2>&1 | grep -oP 'version "?(1\.)?\K\d+' || true)
if [[ $JAVA_MAJOR_VERSION -lt 8 ]]; then
  echo "Java 8 or higher is required!"
  exit 1
fi

# -----------------------------------------------------------------------------------------------------
# install maven
source ../internal/set-program.sh https://archive.apache.org/dist/maven/maven-3/3.8.6/binaries/apache-maven-3.8.6-bin.zip apache-maven-3.8.6 tools/apache-maven M2_HOME

# Test it
mvn -version

# go back
cd $back_maven

echo "=============================================================================================================================="