@echo off
rem go to script dir
set back_java=%cd%
cd %DEVELOPMENT_HOME%\scripts\java

echo ==============================================================================================================================
echo Set the environment for Azul Zulu JDK 7

rem -----------------------------------------------------------------------------------------------------
rem check the DEVELOPMENT_HOME variable
call ..\internal\check-develpment-folder var1
if /I "%var1:error=%" neq "%var1%" (
	echo %var1%
    goto exit
) else (
 	echo %var1%
) 

echo(
echo(

rem -----------------------------------------------------------------------------------------------------
rem install java
call ..\internal\set-program https://cdn.azul.com/zulu/bin/zulu7.56.0.11-ca-jdk7.0.352-win_x64.zip jdk7-azul-zulu languages\java JAVA_HOME

rem Test it
call java -version

echo(
echo(

rem -----------------------------------------------------------------------------------------------------
rem install ant
call ..\ant\set-ant-1.9

echo(
echo(

rem -----------------------------------------------------------------------------------------------------
rem install maven
call ..\maven\set-maven-3.3

echo(
echo(

rem -----------------------------------------------------------------------------------------------------
rem install gradle
call ..\gradle\set-gradle-3.5

rem go back
cd %back_java%

echo ==============================================================================================================================
:exit