@echo off
rem go to script dir
set back_tom=%cd%
cd %DEVELOPMENT_HOME%\scripts\tomcat

echo ==============================================================================================================================
echo Set the Environment for Tomcat 9.0 (Java 8, JEE 8 Web = Servlet 4.0, JSP 2.3, EL 3.0, WebSocket 1.1, Authentication (JASIC) 1.1)

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

if not %JAVA_VERSION%==8 (
	echo error: Java 8 is required!
    goto exit
)

rem -----------------------------------------------------------------------------------------------------
rem install Tomcat 9.0
call ..\internal\set-program http://mirror.nbtelecom.com.br/apache/tomcat/tomcat-9/v9.0.14/bin/apache-tomcat-9.0.14.zip apache-tomcat-9.0 servers\apache-tomcat CATALINA_HOME

rem -----------------------------------------------------------------------------------------------------
rem doc Tomcat
call doc-tomcat

rem go back 
cd %back_tom%

echo ==============================================================================================================================
:exit