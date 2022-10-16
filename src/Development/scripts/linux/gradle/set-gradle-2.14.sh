#!/bin/bash
# go to script dir
back_gradle=$(pwd)
cd $DEVELOPMENT_HOME/scripts/gradle

echo "=============================================================================================================================="
echo "Set the environment for Gradle 2.14 (JDK 6)"

# -----------------------------------------------------------------------------------------------------
# check the DEVELOPMENT_HOME variable
result=$(../internal/check-develpment-folder.sh)
if [ -z "${result##*error*}" ] ; then
  echo $result
  return 0
else
  echo $result
fi

# -----------------------------------------------------------------------------------------------------
# check the JAVA_HOME variable
if [[ -z "${JAVA_HOME}" ]] ; then
  echo "error: JAVA_HOME is not configured, please configure it."
  return 0
fi

# -----------------------------------------------------------------------------------------------------
# check Java
JAVA_MAJOR_VERSION=$(java -version 2>&1 | grep -oP 'version "?(1\.)?\K\d+' || true)
if [[ $JAVA_MAJOR_VERSION != 6 ]]; then
  echo "error: Java 6 is required!"
  return 0
fi

# -----------------------------------------------------------------------------------------------------
# install gradle
source ../internal/set-program.sh https://services.gradle.org/distributions/gradle-2.14.1-bin.zip gradle-2.14.1 tools/gradle GRADLE_HOME

# Test it
gradle -v

# go back
cd $back_gradle

echo "=============================================================================================================================="