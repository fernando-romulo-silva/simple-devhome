@echo off
rem go to script dir
set back=%cd%
cd %DEVELOPMENT_HOME%\scripts\tomcat

echo ==============================================================================================================================
echo Set the Environment for Tomcat 9.0 (JEE 8 Web = Servlet 4.0, JSP 2.3, EL 3.0, WebSocket 1.1, Authentication (JASIC) 1.1)

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
rem install java 8
call ..\java\set-java-8

rem -----------------------------------------------------------------------------------------------------
rem install Tomcat 9.0
call ..\internal\set-program http://mirror.nbtelecom.com.br/apache/tomcat/tomcat-9/v9.0.14/bin/apache-tomcat-9.0.14.zip apache-tomcat-9.0 servers\apache-tomcat CATALINA_HOME

rem go back 
cd %back%

echo ==============================================================================================================================
:exit