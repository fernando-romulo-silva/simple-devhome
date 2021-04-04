@echo off
rem download and install zip, tar.gz and other files
set url=%1
set final_name=%2
set dest=%3
set var_name=%4
set current_name=%2

echo -----------------------------------------------------------------------------------------------------
echo set the program %final_name%, please wait

rem ----------------------------------------------------------------------------------------------------- 
rem set Download home
set dev_folder_downloads=%DEVELOPMENT_HOME%\downloads

rem check %userprofile%\Downloads\dev_folder_downloads exists, if not, create it.
if not exist %dev_folder_downloads% mkdir %dev_folder_downloads%

rem check %DEVELOPMENT_HOME%\%dest% exists, if not, create it
if not exist %DEVELOPMENT_HOME%\%dest% mkdir %DEVELOPMENT_HOME%\%dest%

rem -----------------------------------------------------------------------------------------------------
rem get the extension
call ..\internal\get-extension extension %url% %final_name%

rem -----------------------------------------------------------------------------------------------------
rem is the program already installed?

echo %DEVELOPMENT_HOME%\%dest%\%final_name%%extension%

if not exist %DEVELOPMENT_HOME%\%dest%\%final_name% (

  rem is the file already download?
  if not exist %dev_folder_downloads%\%final_name%%extension% (
     rem download it!
	 bitsadmin /reset
	 bitsadmin /transfer "JobName" /priority normal %url% %dev_folder_downloads%\%final_name%%extension% || goto :error
  )
	
  rem if it's a compressed file?
  if not %extension% == .zip (
     
     rem create program folder
     mkdir %dev_folder_downloads%\%final_name%
    
     rem copy it into 
     xcopy %dev_folder_downloads%\%final_name%%extension% %dev_folder_downloads%\%final_name%
     
  ) else if %extension% == .zip (
  
     rem get the folder's name inside
     for /f "delims=/" %%a in ('tar -tf "%%dev_folder_downloads%%\%%final_name%%%%extension%%"') do (
         set current_name=%%a
         goto print 
     )
     :print
     echo current_name %current_name%
     
     rem uncompress it! 
     tar -xf %dev_folder_downloads%\%final_name%.zip --directory %dev_folder_downloads%
  ) 
   
   rem -----------------------------------------------------------------------------------------------------
   rem create the dest folder
   if not exist %DEVELOPMENT_HOME%\%dest%\%final_name% (
       mkdir %DEVELOPMENT_HOME%\%dest%\%final_name%
   )
   
   rem -----------------------------------------------------------------------------------------------------
   rem is the folder extracted equals to final name?   
   if not "%final_name%" == "%current_name%" (
      
      rem grant permission to access folder
      icacls "%dev_folder_downloads%\%current_name%" /grant Everyone:M
      
      rem rename compacted folder to final folder  - access denied process in the folder
      rename %dev_folder_downloads%\%current_name% %final_name%
      
   ) else (
      
      rem grant permission to access folder
      icacls "%dev_folder_downloads%\%final_name%" /grant Everyone:M
   )
   
   rem copy the program folder to dest
   xcopy /y /s %dev_folder_downloads%\%final_name%\*  %DEVELOPMENT_HOME%\%dest%\%final_name%\
   
   rem exclude download folder
   rd /s /q %dev_folder_downloads%\%final_name% 
) 

rem -----------------------------------------------------------------------------------------------------
rem check if need declare environment variable
if not [%var_name%]==[] (

   rem set program environment variable
   set "run=call set %var_name%=%DEVELOPMENT_HOME%\%dest%\%final_name%"
   %run%
   
   rem add the path
   if exist %DEVELOPMENT_HOME%\%dest%\%final_name%\bin (
       set "PATH=%DEVELOPMENT_HOME%\%dest%\%final_name%\bin;%PATH%"
   ) else (
       set "PATH=%DEVELOPMENT_HOME%\%dest%\%final_name%;%PATH%"
   )
   
   rem TODO create a sh file to call a executable or just a shortcut 
   if %extension% == .jar  ( 
      echo java -jar %final_name%.jar > %dev_folder_downloads%\%final_name%\%final_name%.bat
   )
   
   rem print variable
   echo Home variable is %var_name%
)

echo Software %final_name% installed in %DEVELOPMENT_HOME%\%dest%\%final_name%

goto :EOF

:error
echo Failed with error #%errorlevel%.
exit /b %errorlevel%

rem echo ==========================================================================
rem echo FOR DEBUGGING
rem echo extension = %extension% 
rem echo final_name = %final_name%  
rem echo userprofile = %userprofile% 
rem echo dev_folder_downloads = %dev_folder_downloads% 
rem echo current_name = %current_name%
rem echo url = %url%
rem echo server_file = %server_file%
rem echo server_file_temp = %server_file_temp%
rem echo var_name = %var_name%
rem echo ==========================================================================