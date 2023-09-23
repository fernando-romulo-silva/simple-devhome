@echo off
rem go to script dir
set back_jetty=%cd%
cd %DEVELOPMENT_HOME%\scripts\jetty

echo ==============================================================================================================================
echo Set the environment for Jetty 12.0 (Java 17+, JEE 10 Web = Servlet 6.0, JSP 3.1, EL 5.0, WebSocket 2.1, Authentication (JASIC) 2.1)

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

if %JAVA_VERSION% LSS 17 (
	echo error: Java 17 or higher is required!
	goto exit
)

rem -----------------------------------------------------------------------------------------------------
rem install Jetty 12.0
call ..\internal\set-program https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-home/12.0.1/jetty-home-12.0.1.zip jetty-12.0 servers\jetty JETTY_HOME

rem -----------------------------------------------------------------------------------------------------
rem doc Jetty
call doc-jetty

:exit
echo ==============================================================================================================================

rem go back 
cd %back_jetty%