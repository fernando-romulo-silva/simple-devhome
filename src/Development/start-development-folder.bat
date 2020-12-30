@echo off
echo =========================================================================
echo Starting the development home

rem check the DEVELOPMENT_HOME variable
call scripts\windows\internal\check-develpment-folder var1
if /I "%var1:error=%" neq "%var1%" (
	echo %var1%
    goto exit
) else (
	echo %var1%
) 

rem check if the Development folder exists
if not exist "%DEVELOPMENT_HOME%" (
	
	rem create folder
    md "%DEVELOPMENT_HOME%"
    
    rem 
    if errorlevel 1 (
        pause
        goto :exit
    )  
) 

rem copy the structure of folder
xcopy /y /s ".\*" %DEVELOPMENT_HOME%

rem organize scripts
rd /s /q %DEVELOPMENT_HOME%\scripts\linux\
rd /s /q %DEVELOPMENT_HOME%\scripts\mac
rd /s /q %DEVELOPMENT_HOME%\scripts\windows

xcopy /y /s scripts\windows\* %DEVELOPMENT_HOME%\scripts\

del /s /q "%DEVELOPMENT_HOME%\start-development-folder.bat"
del /s /q "%DEVELOPMENT_HOME%\start-development-folder.sh"

rem current dir's backup
set back=%cd%

rem go to windows scripts folder
cd %DEVELOPMENT_HOME%\scripts\

rem create batchs to call folder's scripts batch
for /d %%d in (*) do (

    if not %%d == internal (
    
       cd %%d
    
       for %%f in (*.bat) do (   
           echo call %DEVELOPMENT_HOME%\scripts\%%d\%%f >  %DEVELOPMENT_HOME%\scripts\%%f       
       )
       
       cd ..
    )
)

rem go back 
cd %back%

echo =========================================================================
:exit