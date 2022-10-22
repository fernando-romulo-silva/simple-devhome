@echo off
rem get extension's file
set url=%2
set final_name=%3

If NOT "%url%"=="%url:tar.gz=%" (
  set "%~1=.tar.gz"
  goto exit
)

rem -----------------------------------------------------------------------------------------------------
rem get the serve file name
for %%x in (%url:/= %) do set server_file_temp=%%x

rem remove parameters on url
if /I "%server_file_temp:?=%" neq "server_file_temp" (
   for /f "tokens=1 delims=?" %%a in ("%server_file_temp%") do set server_file=%%a
) else (
   set server_file=%server_file_temp%
)

rem TODO get the extension, "tar.bz2", "bz2", "rar" ? 
for %%i in ("%dev_folder_downloads%\%server_file%") do (
  set "result=%%~xi"
)

set "%~1=%result%"

:exit