@echo off
rem go to script dir
set back=%cd%
cd %DEVELOPMENT_HOME%\scripts\wildfly

echo ==============================================================================================================================
echo Set the Environment for Wildfly 15 Full Profile (JEE 8)

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
rem install java 11
call ..\java\set-java-11-zulu

rem -----------------------------------------------------------------------------------------------------
rem install wildfly 15 Full
call ..\internal\set-program https://download.jboss.org/wildfly/15.0.1.Final/wildfly-15.0.1.Final.zip wildfly-15.0 servers\wildfly WILDFLY_HOME

rem go back 
cd %back%

echo ==============================================================================================================================
:exit