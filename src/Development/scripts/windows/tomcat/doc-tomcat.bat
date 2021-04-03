@echo off
echo -----------------------------------------------------------------------------------------------------
echo Doc for Tomcat
echo 
rem -----------------------------------------------------------------------------------------------------
rem Open to Debug
set CATALINA_OPTS=-Xdebug -Xrunjdwp:transport=dt_socket,address=8000,server=y,suspend=n
set JPDA_OPTS=-agentlib:jdwp=transport=dt_socket,address=8000,server=y,suspend=n

rem -----------------------------------------------------------------------------------------------------
echo ------ Info -------------
echo 
call version.bat
echo 
echo ------ Start ------------
echo 
echo To start Tomcat Server from the command line, execute the following:
echo $ startup.bat
echo or
echo $ catalina.bat run
echo 
echo 
echo ------ Stop -------------
echo 
echo To stop Tomcat Server, execute:
echo $ shutdown.bat
echo 
echo 
echo ------ Deploy -----------
echo 
echo If you copy the war file to %CATALINA_HOME%\webapps\ then tomcat will attempt to (re)deploy it automatically:
echo $ copy yourFileApp.war %CATALINA_HOME%\webapps\
echo 
echo 
echo ------ Debug ------------
echo 
echo The server is already on debug mode, then you have to configure your debugger to connect to localhost:8000
echo -----------------------------------------------------------------------------------------------------
