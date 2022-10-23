@echo off
rem go to script dir
set back_tom=%cd%
cd %DEVELOPMENT_HOME%\scripts\tomcat

echo ==============================================================================================================================
echo Set the Environment for Tomcat 10.0 (Java 11+, JEE 9 Web = Servlet 5.0, JSP 3.0, EL 4.0, WebSocket 2.0, Authentication (JASIC) 2.0)

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
rem install Tomcat 10.0
call ..\internal\set-program https://mirror.nbtelecom.com.br/apache/tomcat/tomcat-10/v10.0.6/bin/apache-tomcat-10.0.6.tar.gz apache-tomcat-10.0 servers\apache-tomcat CATALINA_HOME

rem -----------------------------------------------------------------------------------------------------
rem doc Tomcat
call doc-tomcat

rem go back 
cd %back_tom%

echo ==============================================================================================================================
:exit