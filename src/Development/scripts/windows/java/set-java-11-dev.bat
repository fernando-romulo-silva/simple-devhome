@echo off
rem go to script dir
set back=%cd%
cd %DEVELOPMENT_HOME%\scripts\java

echo ==============================================================================================================================
echo Set the environment for JDK 11-Dev (Jdk 11 with DCEVM-Full and HotswapAgent)

rem -----------------------------------------------------------------------------------------------------
rem check the DEVELOPMENT_HOME variable
call ..\internal\check-develpment-folder var1
if /I "%var1:error=%" neq "%var1%" (
	echo %var1%
    goto exit
) else (
 	echo %var1%
) 

rem -----------------------------------------------------------------------------------------------------
rem install java
call ..\internal\set-program https://github.com/TravaOpenJDK/trava-jdk-11-dcevm/releases/download/dcevm-11.0.1+7/java11-openjdk-dcevm-windows.zip jdk11-dev languages\java JAVA_HOME

rem Test it
call java -version

rem go back
cd %back%

echo ==============================================================================================================================
:exit