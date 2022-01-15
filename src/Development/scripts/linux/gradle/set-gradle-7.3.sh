#!/bin/bash
# go to script dir
back_gradle=$(pwd)
cd $DEVELOPMENT_HOME/scripts/gradle

echo "=============================================================================================================================="
echo "Set the environment for Gradle 7.3 (JDK 17)"

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
source ../internal/set-program.sh https://downloads.gradle-dn.com/distributions/gradle-7.3.3-bin.zip gradle-7.3.3 tools/gradle GRADLE_HOME

# Test it
gradle -v

# go back
cd $back_gradle

echo "=============================================================================================================================="
