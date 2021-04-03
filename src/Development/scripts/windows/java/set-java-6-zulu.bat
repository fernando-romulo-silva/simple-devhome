@echo off
rem go to script dir
set back_java=%cd%
cd %DEVELOPMENT_HOME%\scripts\java

echo ==============================================================================================================================
echo Set the environment for Zulu JDK 6

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
rem install java
call ..\internal\set-program https://cdn.azul.com/zulu/bin/zulu6.22.0.3-jdk6.0.119-win_x64.zip jdk6-zulu languages\java JAVA_HOME

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
call ..\maven\set-maven-3.2

echo(
echo( 

rem -----------------------------------------------------------------------------------------------------
rem install gradle
call ..\gradle\set-gradle-2.14

rem go back
cd %back_java%

echo ==============================================================================================================================
:exit