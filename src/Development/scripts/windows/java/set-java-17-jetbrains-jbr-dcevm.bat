@echo off
rem go to script dir
set back_java=%cd%
cd %DEVELOPMENT_HOME%\scripts\java

echo ==============================================================================================================================
echo Set the environment for JetBrains JBR JDK 17 (Open Jdk 17 with Dcevm-Full and HotswapAgent)

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
call ..\internal\set-program https://cache-redirector.jetbrains.com/intellij-jbr/jbr_dcevm-17_0_1-windows-x64-b164.8.tar.gz jdk17-jetbrains-jbr-dcevm languages\java JAVA_HOME

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

rem -----------------------------------------------------------------------------------------------------
rem install ant
call ..\ant\set-ant-1.10

rem test it
call ant -version

echo(
echo(

rem -----------------------------------------------------------------------------------------------------
rem install maven
call ..\maven\set-maven-3.8

echo(
echo( 

rem -----------------------------------------------------------------------------------------------------
rem install gradle
call ..\gradle\set-gradle-7.5

echo(
echo Don't forget to run your application with additional options '-XX:+AllowEnhancedClassRedefinition -XX:HotswapAgent=fatjar'

rem go back
cd %back_java%

echo ==============================================================================================================================
:exit