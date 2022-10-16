@echo off
rem go to script dir
set back_glass=%cd%
cd %DEVELOPMENT_HOME%\scripts\glassfish

echo ==============================================================================================================================
echo Set the Environment for Glassfish 6.1 Full Profile (JEE 9.1)

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
rem install glassfish 5.1 full
call ..\internal\set-program https://download.eclipse.org/ee4j/glassfish/glassfish-6.1.0.zip glassfish-6.1-full servers/glassfish GLASSFISH_HOME     

rem -----------------------------------------------------------------------------------------------------
rem doc glassfish
call doc-glassfish

rem go back 
cd %back_glass%

echo ==============================================================================================================================
:exit