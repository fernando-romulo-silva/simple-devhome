@echo off
rem go to script dir
set back_java=%cd%
cd %DEVELOPMENT_HOME%\scripts\java

echo ================================================================================
echo Set Oracle HotSpot JDK 21

rem --------------------------------------------------------------------
rem check the DEVELOPMENT_HOME variable
call ..\internal\check-develpment-folder var1
if /I "%var1:error=%" neq "%var1%" (
	echo %var1%
    goto exit
) else (
 	echo %var1%
) 

rem --------------------------------------------------------------------
rem install java
call ..\internal\set-program https://cache-redirector.jetbrains.com/intellij-jbr/jbr_fd-21.0.2-windows-x64-b346.3.tar.gz jdk21-oracle-hotspot languages\java JAVA_HOME

rem --------------------
rem install HotswapAgent
call ../internal/set-program.sh https://github.com/HotswapProjects/HotswapAgent/releases/download/RELEASE-1.4.1/hotswap-agent-1.4.1.jar hotswap-agent-1.4.1 tools/HotswapAgent

if not exist $JAVA_HOME/lib/hotswap (
	mkdir $JAVA_HOME/lib/hotswap
)	

copy $DEVELOPMENT_HOME/tools/HotswapAgent/hotswap-agent-1.4.1/hotswap-agent-1.4.1.jar $JAVA_HOME/lib/hotswap/hotswap-agent.jar

rem test it
call java -version

echo(
echo(

rem --------------------------------------------------------------------
rem install ant
call ..\ant\set-ant-1.10

echo(
echo(

rem --------------------------------------------------------------------
rem install maven
call ..\maven\set-maven-3.9

echo(
echo( 

rem --------------------------------------------------------------------
rem install gradle
call ..\gradle\set-gradle-9.1

rem go back
cd %back_java%

echo ================================================================================
:exit