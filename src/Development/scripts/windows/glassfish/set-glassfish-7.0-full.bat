@echo off
rem go to script dir
set back_glass=%cd%
cd %DEVELOPMENT_HOME%\scripts\glassfish

echo ==============================================================================================================================
echo Set the Environment for Glassfish 7.0 Full Profile (JEE 10)

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
    echo error: JAVA_HOME is not configured, please configure it.
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

if not %JAVA_VERSION%==17 (
	echo error: Java 11 is required!
    goto exit	
)
rem -----------------------------------------------------------------------------------------------------
rem install glassfish 7.0 full
call ..\internal\set-program https://download.eclipse.org/ee4j/glassfish/glassfish-7.0.8.zip glassfish-7.0-full servers/glassfish GLASSFISH_HOME     

rem -----------------------------------------------------------------------------------------------------
rem doc glassfish
call doc-glassfish

:exit
echo ==============================================================================================================================

rem go back 
cd %back_glass%
