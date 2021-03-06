@echo off
rem go to script dir
set back=%cd%
cd %DEVELOPMENT_HOME%\scripts\utils

echo ==============================================================================================================================
echo Set Tools

rem -----------------------------------------------------------------------------------------------------
rem check the DEVELOPMENT_HOME variable
call ..\internal\check-develpment-folder var1
if /I "%var1:error=%" neq "%var1%" (
	echo %var1%
    exit /B 
) else (
 	echo %var1%
)

rem -----------------------------------------------------------------------------------------------------
rem install WinSCP
call ..\internal\set-program https://winscp.net/download/WinSCP-5.13.7-Setup.exe winSCP-5.13 tools\winSCP


rem -----------------------------------------------------------------------------------------------------
rem install Putty
call ..\internal\set-program https://the.earth.li/~sgtatham/putty/0.70/w64/putty.exe putty-0.70 tools\putty

rem go back
cd %back%

echo ==============================================================================================================================
:exit