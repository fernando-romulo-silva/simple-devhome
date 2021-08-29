#!/bin/bash
# go to script dir
back_ant=$(pwd)
cd $DEVELOPMENT_HOME/scripts/ant

echo "=============================================================================================================================="
echo "Set the environment for Ant 1.9 (JDK 6, JDK 7)"

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
# install ant
source ../internal/set-program.sh https://downloads.apache.org//ant/binaries/apache-ant-1.9.15-bin.zip apache-ant-1.9.15 tools/apache-ant ANT_HOME

export ANT_ARGS="-logger org.apache.tools.ant.listener.AnsiColorLogger"
export ANT_OPTS="-Xms256M -Xmx512M"

# Test it
ant -version

# go back
cd $back_ant

echo "=============================================================================================================================="