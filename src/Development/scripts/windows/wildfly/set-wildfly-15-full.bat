@echo off
rem go to script dir
set back_wild=%cd%
cd %DEVELOPMENT_HOME%\scripts\wildfly

echo ==============================================================================================================================
echo Set the Environment for Wildfly 15 Full Profile (Java11+, JEE 8)

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

if %JAVA_VERSION% LSS 11 (
	echo error: Java 11 or higher is required!
	goto exit
)

rem -----------------------------------------------------------------------------------------------------
rem install wildfly 15 Full
call ..\internal\set-program https://download.jboss.org/wildfly/15.0.1.Final/wildfly-15.0.1.Final.zip wildfly-15.0 servers\wildfly WILDFLY_HOME

rem -----------------------------------------------------------------------------------------------------
rem doc Wildfly
call doc-wildfly

:exit
echo ==============================================================================================================================

rem go back 
cd %back_wild%