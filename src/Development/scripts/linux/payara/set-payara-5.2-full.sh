#!/bin/bash
# go to script dir
back_pay=$(pwd)
cd $DEVELOPMENT_HOME/scripts/payara

echo "=============================================================================================================================="
echo "Set the environment for Payara 5.2 Full Profile (JEE 9)"

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
# install java 11
source ../java/set-java-11-zulu.sh

# -----------------------------------------------------------------------------------------------------
# install Payara 5.2
source ../internal/set-program.sh https://s3-eu-west-1.amazonaws.com/payara.fish/Payara+Downloads/5.2021.1/payara-5.2021.1.zip payara-5.2-full servers/payara PAYARA_HOME

# -----------------------------------------------------------------------------------------------------
# doc Payara
source ../payara/doc-payara.sh

# go back
cd $back_pay

echo "=============================================================================================================================="