@echo off
rem go to script dir
set back_tom=%cd%
cd %DEVELOPMENT_HOME%\scripts\tomcat

echo ==============================================================================================================================
echo Set the Environment for Tomcat 8.5 (JEE 7 Web = Servlet 3.1, JSP 2.3, EL 3.0, WebSocket 1.1, Authentication (JASIC) 1.1)

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
rem install java 7
call ..\java\set-java-7-zulu

rem -----------------------------------------------------------------------------------------------------
rem install Tomcat 8.5
call ..\internal\set-program https://downloads.apache.org/tomcat/tomcat-8/v8.5.64/bin/apache-tomcat-8.5.64.zip apache-tomcat-8.5 servers\apache-tomcat CATALINA_HOME

call doc-tomcat

rem go back 
cd %back_tom%

echo ==============================================================================================================================
:exit