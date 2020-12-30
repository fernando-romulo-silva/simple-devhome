@echo off
rem go to script dir
set back=%cd%
cd %DEVELOPMENT_HOME%\scripts\java

echo ==============================================================================================================================
echo Set the environment for JDK 8-Dev (Jdk 8 with DCEVM-Light and HotswapAgent)

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
rem install java
call ..\internal\set-program https://cdn.azul.com/zulu/bin/zulu8.31.0.1-jdk8.0.181-win_x64.zip jdk8-dev languages\java JAVA_HOME

rem test it
call java -version

echo(
echo(

rem -----------------------------------------------------------------------------------------------------
rem install DCEVM 
call ..\internal\set-program https://github.com/dcevm/dcevm/releases/download/light-jdk8u181/DCEVM-8u181-installer.jar DCEVM-light-8 tools\DCEVM

rem backup the jvm.dll file
if not exist %JAVA_HOME%\jre\bin\server\jvm.dll.backup (
    rename %JAVA_HOME%\jre\bin\server\jvm.dll jvm.dll.backup
)

rem extract the DCEVM's jvm.dll to jdk
call unzip -q -p %DEVELOPMENT_HOME%\tools\DCEVM\DCEVM-light-8\DCEVM-light-8.jar windows_amd64_compiler2\product\jvm.dll > %JAVA_HOME%\jre\bin\server\jvm.dll

rem test it
call java -version

echo(
echo(

rem -----------------------------------------------------------------------------------------------------
rem install HotswapAgent
call ..\internal\set-program https://github.com/HotswapProjects/HotswapAgent/releases/download/RELEASE-1.3.0/hotswap-agent-1.3.0.jar hotswap-agent-1.3.0 tools\HotswapAgent

echo To use hotswap agent, launch your application server with options: -javaagent:'path_to_jar_file'\hotswap-agent-1.3.0.jar
echo Don't forget to put the hotswap-agent.properties on your classpath (src/main/resources)
echo(

rem go back
cd %back%

echo ==============================================================================================================================
:exit