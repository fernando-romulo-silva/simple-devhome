@echo off
rem go to script dir
set back_java=%cd%
cd %DEVELOPMENT_HOME%\scripts\java

echo ==============================================================================================================================
echo Set the environment for Zulu JDK 16

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
call ..\internal\set-program https://cdn.azul.com/zulu/bin/zulu11.29.3-ca-jdk11.0.2-win_x64.zip jdk16-zulu languages\java JAVA_HOME

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
call ..\maven\set-maven-3.6

echo(
echo( 

rem -----------------------------------------------------------------------------------------------------
rem install gradle
rem call ..\gradle\set-gradle-6.8

rem go back
cd %back_java%

echo ==============================================================================================================================
:exit