@echo off
rem go to script dir
set back_java=%cd%
cd %DEVELOPMENT_HOME%\scripts\java

echo ==============================================================================================================================
echo Set the environment for Oracle GraalVM JDK 21

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
call ..\internal\set-program https://github.com/graalvm/graalvm-ce-builds/releases/download/jdk-21.0.0/graalvm-community-jdk-21.0.0_windows-x64_bin.zip jdk21-oracle-graalvm languages\java JAVA_HOME

rem test it
call java -version

echo(
echo(

rem -----------------------------------------------------------------------------------------------------
rem install ant
call ..\ant\set-ant-1.10

echo(
echo(

rem -----------------------------------------------------------------------------------------------------
rem install maven
call ..\maven\set-maven-3.9

echo(
echo( 

rem -----------------------------------------------------------------------------------------------------
rem install gradle
call ..\gradle\set-gradle-9.1

rem go back
cd %back_java%

echo ==============================================================================================================================
:exit