@echo off
rem go to script dir
set back=%cd%
cd %DEVELOPMENT_HOME%\scripts\java

echo ==============================================================================================================================
echo Set the environment for Zulu JDK 7

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
call ..\internal\set-program https://cdn.azul.com/zulu/bin/zulu7.25.0.5-jdk7.0.201-win_x64.zip jdk7-zulu languages\java JAVA_HOME

rem Test it
call java -version

echo(
echo(

rem -----------------------------------------------------------------------------------------------------
rem install ant
call ..\internal\set-program https://downloads.apache.org//ant/binaries/apache-ant-1.9.15-bin.zip apache-ant-1.9.15 tools\apache-ant ANT_HOME

rem Test it
call ant -version

echo(
echo(

rem -----------------------------------------------------------------------------------------------------
rem install maven
call ..\internal\set-program https://archive.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.zip apache-maven-3.3.9 tools\apache-maven M2_HOME

rem Test it
call mvn -version 

echo(
echo(

rem -----------------------------------------------------------------------------------------------------
rem install gradle
call ..\internal\set-program https://services.gradle.org/distributions/gradle-3.5.1-bin.zip gradle-3.5.1 tools\gradle GRADLE_HOME

rem Test it
call gradle -v

rem go back
cd %back%

echo ==============================================================================================================================
:exit