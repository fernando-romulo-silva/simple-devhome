@echo off
rem go to script dir
set back_tom=%cd%
cd %DEVELOPMENT_HOME%\scripts\tomcat

echo ==============================================================================================================================
echo Set the Environment for Tomcat 7.0 (Java 6, JEE 6 Web = Servlet 3.0, JSP 2.2, EL 2.2, WebSocket 1.1, Authentication (JASIC) N/A)
 
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
rem install Tomcat 7.0
call ..\internal\set-program http://mirror.nbtelecom.com.br/apache/tomcat/tomcat-7/v7.0.92/bin/apache-tomcat-7.0.92.zip apache-tomcat-7.0 servers\apache-tomcat CATALINA_HOME

rem -----------------------------------------------------------------------------------------------------
rem doc Tomcat
call doc-tomcat

:exit
echo ==============================================================================================================================

rem go back 
cd %back_tom%