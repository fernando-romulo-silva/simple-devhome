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

if %JAVA_VERSION% LSS 11 (
	echo error: Java 11 or higher is required!
	goto exit
)  

rem -----------------------------------------------------------------------------------------------------
rem install Payara 5.2 Full
call ..\internal\set-program https://s3-eu-west-1.amazonaws.com/payara.fish/Payara+Downloads/5.2022.3/payara-5.2022.3.zip payara-5.2-full servers\payara PAYARA_HOME

rem -----------------------------------------------------------------------------------------------------
rem doc Payara
call doc-payara

:exit
echo ==============================================================================================================================

rem go bac_pay
cd %bac_pay%