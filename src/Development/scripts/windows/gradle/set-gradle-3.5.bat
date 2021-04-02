@echo off
rem go to script dir
set back=%cd%
cd %DEVELOPMENT_HOME%\scripts\ant

echo ==============================================================================================================================
echo Set the environment for Gradle 3.5 (JDK7)

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
call ..\internal\set-program https://services.gradle.org/distributions/gradle-3.5.1-bin.zip gradle-3.5.1 tools\gradle GRADLE_HOME

rem Test it
call gradle -v

rem go back
cd %back%

echo ==============================================================================================================================
:exit