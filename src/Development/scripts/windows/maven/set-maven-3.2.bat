@echo off
rem go to script dir
set back=%cd%
cd %DEVELOPMENT_HOME%\scripts\maven

echo ==============================================================================================================================
echo Set the environment for Maven 3.2 (JDK 6)

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
if %JAVA_HOME% == "" (
   echo Java home, JAVA_HOME, is not configured, please configure it.
   exit /B 
)

rem -----------------------------------------------------------------------------------------------------
rem install maven
call ..\internal\set-program https://archive.apache.org/dist/maven/maven-3/3.2.5/binaries/apache-maven-3.2.5-bin.zip apache-maven-3.2.5 tools\apache-maven M2_HOME

rem Test it
call mvn -version 

rem go back
cd %back%

echo ==============================================================================================================================
:exit