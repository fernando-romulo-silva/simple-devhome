@echo off
rem go to script dir
set back=%cd%
cd %DEVELOPMENT_HOME%\scripts\ant

echo ==============================================================================================================================
echo Set the environment for Ant 1.9 (JDK 6, JDK 7)

rem -----------------------------------------------------------------------------------------------------
rem check the DEVELOPMENT_HOME variable
call ..\internal\check-develpment-folder var1
if /I "%var1:error=%" neq "%var1%" (
	echo %var1%
    exit /B 
) else (
 	echo %var1%
)

rem -----------------------------------------------------------------------------------------------------
rem check JAVA_HOME
if %JAVA_HOME%=="" (
    echo Java home, JAVA_HOME, is not configured, please configure it.
    exit /B
)

rem -----------------------------------------------------------------------------------------------------
rem install ant
call ..\internal\set-program https://downloads.apache.org//ant/binaries/apache-ant-1.9.16-bin.zip apache-ant-1.9.16 tools\apache-ant ANT_HOME

rem Test it
call ant -version

rem go back
cd %back%

echo ==============================================================================================================================
:exit