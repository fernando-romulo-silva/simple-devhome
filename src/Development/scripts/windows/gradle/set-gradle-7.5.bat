@echo off
rem go to script dir
set back=%cd%
cd %DEVELOPMENT_HOME%\scripts\gradle

echo ==============================================================================================================================
echo Set the environment for Gradle 7.5 (JDK 17)

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
rem install gradle
call ..\internal\set-program https://services.gradle.org/distributions/gradle-7.5.1-bin.zip gradle-7.5.1 tools\gradle GRADLE_HOME

rem Test it
call gradle -v

rem go back
cd %back%

echo ==============================================================================================================================
:exit