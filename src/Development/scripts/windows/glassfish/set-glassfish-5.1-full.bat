@echo off
rem go to script dir
set back_glass=%cd%
cd %DEVELOPMENT_HOME%\scripts\glassfish

echo ==============================================================================================================================
echo Set the Environment for Glassfish 5.1 Full Profile (JEE 8)

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
if %JAVA_HOME%=="" (
    echo error: JAVA_HOME is not configured, please configure it.
    cd %back%
    exit /B
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

if not %JAVA_VERSION%==8 (
	echo error: Java 8 is required!
	cd %back%
    exit /B	
)

rem -----------------------------------------------------------------------------------------------------
rem install glassfish 5.1 full
call ..\internal\set-program https://repo1.maven.org/maven2/org/glassfish/main/distributions/glassfish/5.1.0/glassfish-5.1.0.zip glassfish-5.1-full servers\glassfish GLASSFISH_HOME

rem -----------------------------------------------------------------------------------------------------
rem doc glassfish
call doc-glassfish

rem go back 
cd %back_glass%

echo ==============================================================================================================================
:exit