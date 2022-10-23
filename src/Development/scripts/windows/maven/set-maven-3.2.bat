@echo off
rem go to script dir
set back_maven=%cd%
cd %DEVELOPMENT_HOME%\scripts\maven

echo ==============================================================================================================================
echo Set the environment for Maven 3.2 (JDK 6)

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
rem check JAVA_HOME
if %JAVA_HOME% == "" (
   echo Java home, JAVA_HOME, is not configured, please configure it.
   goto exit 
)

rem -----------------------------------------------------------------------------------------------------
rem check Java version
set JAVA_VERSION=0
for /f "tokens=3" %%g in ('java -Xms32M -Xmx32M -version 2^>^&1 ^| findstr /i "version"') do (
  set JAVA_VERSION=%%g
)

set JAVA_VERSION=%JAVA_VERSION:"=%
for /f "delims=.-_ tokens=1-2" %%v in ("%JAVA_VERSION%") do (
  if /I "%%v" EQU "1" (
    set JAVA_VERSION=%%w
  ) else (
    set JAVA_VERSION=%%v
  )
)

if not %JAVA_VERSION%==6 (
	echo error: Java 6 is required!
    goto exit
)

rem -----------------------------------------------------------------------------------------------------
rem install maven
call ..\internal\set-program https://archive.apache.org/dist/maven/maven-3/3.2.5/binaries/apache-maven-3.2.5-bin.zip apache-maven-3.2.5 tools\apache-maven M2_HOME

rem Test it
call mvn -version 

:exit
echo ==============================================================================================================================

rem go back
cd %back_maven%