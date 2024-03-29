@echo off
rem go to script dir
set back_java=%cd%
cd %DEVELOPMENT_HOME%\scripts\java

echo ==============================================================================================================================
echo Set the environment for Trava Open JDK 11 (Open Jdk 11 with Dcevm-Full and HotswapAgent)

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
call ..\internal\set-program https://github.com/TravaOpenJDK/trava-jdk-11-dcevm/releases/download/dcevm-11.0.1+7/java11-openjdk-dcevm-windows.zip jdk11-travis-travaopen languages\java JAVA_HOME

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
call ..\gradle\set-gradle-6.9

echo(
echo Don't forget to put the hotswap-agent.properties on your classpath (src/main/resources)

rem go back
cd %back_java%

echo ==============================================================================================================================
:exit