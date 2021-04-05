@echo off
rem go to script dir
set bac_pay=%cd%
cd %DEVELOPMENT_HOME%\scripts\payara

echo ==============================================================================================================================
echo Set the Environment for Payara 5.2 Full Profile (JEE 9)

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
rem install Payara 5.2 Full
call ..\internal\set-program https://s3-eu-west-1.amazonaws.com/payara.fish/Payara+Downloads/5.2021.1/payara-5.2021.1.zip payara-5.2-full servers\payara PAYARA_HOME

rem -----------------------------------------------------------------------------------------------------
rem doc Payara
call doc-payara

rem go back 
cd %bac_pay%

echo ==============================================================================================================================
:exit