@echo off
rem go to script dir
set back_glass=%cd%
cd %DEVELOPMENT_HOME%\scripts\glassfish

echo ==============================================================================================================================
echo Set the Environment for Glassfish 5.0 Full Profile (JEE 8)

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
rem install glassfish 5.0 full
call ..\internal\set-program https://repo1.maven.org/maven2/org/glassfish/main/distributions/glassfish/5.0.1/glassfish-5.0.1.zip glassfish-5.0-full servers\glassfish GLASSFISH_HOME

rem -----------------------------------------------------------------------------------------------------
rem doc glassfish
call doc-glassfish

rem go back 
cd %back_glass%

echo ==============================================================================================================================
:exit