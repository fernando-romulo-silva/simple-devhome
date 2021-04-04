@echo off
rem go to script dir
set back_jetty=%cd%
cd %DEVELOPMENT_HOME%\scripts\jetty

echo ==============================================================================================================================
echo Set the Environment for Jetty 9.4

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
call ..\java\set-java-8-zulu

rem -----------------------------------------------------------------------------------------------------
rem install Jetty 9.4
call ..\internal\set-program https://repo1.maven.org/maven2/org/eclipse/jetty/jetty-distribution/9.4.14.v20181114/jetty-distribution-9.4.14.v20181114.zip jetty-9.4 servers\jetty JETTY_HOME

call doc-jetty

rem go back 
cd %back_jetty%

echo ==============================================================================================================================
:exit