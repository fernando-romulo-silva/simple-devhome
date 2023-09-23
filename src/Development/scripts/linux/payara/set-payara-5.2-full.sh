#!/bin/bash
# go to script dir
back_pay=$(pwd)
cd $DEVELOPMENT_HOME/scripts/payara

echo "=============================================================================================================================="
echo "Set the environment for Payara 5.2 Full Profile (JEE 8)"

# -----------------------------------------------------------------------------------------------------
# check the DEVELOPMENT_HOME variable
result=$(../internal/check-develpment-folder.sh)
if [ -z "${result##*error*}" ] ; then
  source ../internal/exit-script.sh $back_pay $result
  return 0
else
  echo $result
fi

# -----------------------------------------------------------------------------------------------------
# check the JAVA_HOME variable
if [[ -z "${JAVA_HOME}" ]] ; then
  source ../internal/exit-script.sh $back_pay "error: JAVA_HOME is not configured, please configure it."
  return 0
fi

# -----------------------------------------------------------------------------------------------------
# check Java 11+
JAVA_MAJOR_VERSION=$(java -version 2>&1 | grep -oP 'version "?(1\.)?\K\d+' || true)
if [[ $JAVA_MAJOR_VERSION -lt 11 ]]; then
  source ../internal/exit-script.sh $back_pay "error: Java 11 or higher is required!"  
  return 0
fi

# -----------------------------------------------------------------------------------------------------
# install Payara 5.2
source ../internal/set-program.sh https://nexus.payara.fish/repository/payara-community/fish/payara/distributions/payara/5.2022.5/payara-5.2022.5.zip payara-5.2-full servers/payara PAYARA_HOME
                                  
# -----------------------------------------------------------------------------------------------------
# doc Payara
source ../payara/doc-payara.sh

# go back
cd $back_pay

echo "=============================================================================================================================="