#!/bin/bash
# go to script dir
back_ant=$(pwd)
cd $DEVELOPMENT_HOME/scripts/ant

echo "=============================================================================================================================="
echo "Set the environment for Ant 1.10 (JDK 8+)"

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
  echo "Java home, JAVA_HOME, is not configured, please configure it."
  return 0
fi

# -----------------------------------------------------------------------------------------------------
# check Java 8+
JAVA_MAJOR_VERSION=$(java -version 2>&1 | grep -oP 'version "?(1\.)?\K\d+' || true)
if [[ $JAVA_MAJOR_VERSION -lt 8 ]]; then
  echo "Java 8 or higher is required!"
  return 0
fi

# -----------------------------------------------------------------------------------------------------
# install ant
source ../internal/set-program.sh https://dlcdn.apache.org//ant/binaries/apache-ant-1.10.12-bin.zip apache-ant-1.10.9 tools/apache-ant ANT_HOME

export ANT_ARGS="-logger org.apache.tools.ant.listener.AnsiColorLogger"
export ANT_OPTS="-Xms256M -Xmx512M"

# Test it
ant -version

# go back
cd $back_ant

echo "=============================================================================================================================="