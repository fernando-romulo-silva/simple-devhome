#!/bin/bash

if [[ -z "${DEVELOPMENT_HOME}" ]];then
  echo $DEVELOPMENT_HOME
  return="error: your environment variable DEVELOPMENT_HOME is not configured, please configure it."	
else
  return="ok: your development folder is "$DEVELOPMENT_HOME	
fi

echo "$return"