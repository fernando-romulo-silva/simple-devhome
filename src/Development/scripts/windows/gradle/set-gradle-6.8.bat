@echo off
rem go to script dir
set back=%cd%
cd %DEVELOPMENT_HOME%\scripts\ant

echo ==============================================================================================================================
echo Set the environment for Gradle 3.5 (JDK8)

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
rem install gradle
call ..\internal\set-program https://services.gradle.org/distributions/gradle-6.8.3-bin.zip gradle-6.8.3 tools\gradle GRADLE_HOME

rem Test it
call gradle -v

rem go back
cd %back%

echo ==============================================================================================================================
:exit