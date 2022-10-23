@echo off
rem go to script dir
set back_tom=%cd%
cd %DEVELOPMENT_HOME%\scripts\tomcat

echo ==============================================================================================================================
echo Set the Environment for Tomcat 8.5 (Java 7, JEE 7 Web = Servlet 3.1, JSP 2.3, EL 3.0, WebSocket 1.1, Authentication (JASIC) 1.1)

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

if not %JAVA_VERSION%==7 (
	echo error: Java 7 is required!
    goto exit
)

rem -----------------------------------------------------------------------------------------------------
rem install Tomcat 8.5
call ..\internal\set-program https://downloads.apache.org/tomcat/tomcat-8/v8.5.64/bin/apache-tomcat-8.5.64.zip apache-tomcat-8.5 servers\apache-tomcat CATALINA_HOME

rem -----------------------------------------------------------------------------------------------------
rem doc Tomcat
call doc-tomcat

:exit
echo ==============================================================================================================================

rem go back 
cd %back_tom%