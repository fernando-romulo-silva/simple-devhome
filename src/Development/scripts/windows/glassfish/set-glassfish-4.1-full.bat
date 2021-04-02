@echo off
rem go to script dir
set back=%cd%
cd %DEVELOPMENT_HOME%\scripts\glassfish

echo ==============================================================================================================================
echo Set the Environment for Glassfish 4.1 Full Profile

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
rem install glassfish 4.1 full
call ..\internal\set-program http://download.java.net/glassfish/4.1.2/release/glassfish-4.1.2.zip glassfish-4.1 servers\glassfish GLASSFISH_HOME

rem go back 
cd %back%

echo ==============================================================================================================================
:exit