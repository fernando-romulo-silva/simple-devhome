@echo off
rem go to script dir
set back=%cd%
cd %DEVELOPMENT_HOME%\scripts\java

echo ==============================================================================================================================
echo Set the environment for JDK 11

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
call ..\internal\set-program https://cdn.azul.com/zulu/bin/zulu11.29.3-ca-jdk11.0.2-win_x64.zip jdk11 languages\java JAVA_HOME

rem test it
call java -version

echo(
echo(

rem -----------------------------------------------------------------------------------------------------
rem install ant
if not exist %DEVELOPMENT_HOME%\tools\apache-ant\apache-ant-1.10.5 (
	call ..\internal\set-program http://mirror.nbtelecom.com.br/apache//ant/binaries/apache-ant-1.10.5-bin.zip apache-ant-1.10.5 tools\apache-ant ANT_HOME
)

rem test it
call ant -version

echo(
echo(

rem -----------------------------------------------------------------------------------------------------
rem install maven
call ..\internal\set-program http://ftp.unicamp.br/pub/apache/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.zip apache-maven-3.6.0 tools\apache-maven M2_HOME

rem test it
call mvn -version

echo(
echo( 

rem -----------------------------------------------------------------------------------------------------
rem install gradle
call ..\internal\set-program https://services.gradle.org/distributions/gradle-5.1.1-bin.zip gradle-5.1.1 tools\gradle GRADLE_HOME

rem test it
call gradle -v

rem go back
cd %back%

echo ==============================================================================================================================
:exit