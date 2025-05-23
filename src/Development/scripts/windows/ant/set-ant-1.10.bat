@echo off
rem go to script dir
set back_ant=%cd%
cd %DEVELOPMENT_HOME%\scripts\ant

echo ==============================================================================================================================
echo Set the environment for Ant 1.10 (JDK 8+)

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

if %JAVA_VERSION% LSS 8 (
	echo error: Java 8 or higher is required!
	goto exit
) 

rem -----------------------------------------------------------------------------------------------------
rem install ant
call ..\internal\set-program https://dlcdn.apache.org//ant/binaries/apache-ant-1.10.15-bin.zip apache-ant-1.10 tools\apache-ant ANT_HOME

set "ANT_ARGS=-logger org.apache.tools.ant.listener.AnsiColorLogger"
set "ANT_OPTS=-Xms256M -Xmx512M"

rem Test it
call ant -version

:exit
echo ==============================================================================================================================

rem go back_ant
cd %back_ant%
