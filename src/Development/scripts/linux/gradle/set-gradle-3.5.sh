#!/bin/bash
# go to script dir
back_gradle=$(pwd)
cd $DEVELOPMENT_HOME/scripts/gradle

echo "=============================================================================================================================="
echo "Set the environment for Gradle 3.5 (JDK 7)"

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
# install gradle
. $DEVELOPMENT_HOME/scripts/internal/set-program.sh https://services.gradle.org/distributions/gradle-3.5.1-bin.zip gradle-3.5.1 tools/gradle GRADLE_HOME

# Test it
gradle -v

# go back
cd $back_gradle

echo "=============================================================================================================================="