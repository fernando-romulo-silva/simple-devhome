@echo off

if %DEVELOPMENT_HOME%=="" (
   set "result=error: your environment variable DEVELOPMENT_HOME is not configured, please configure it."
) else (
   set "result=okay: your development folder is %DEVELOPMENT_HOME%"
)
set "%~1=%result%"