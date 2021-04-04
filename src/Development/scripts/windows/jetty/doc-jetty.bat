@echo off
echo -----------------------------------------------------------------------------------------------------
echo Doc for Jetty
echo(

rem -----------------------------------------------------------------------------------------------------
rem Open to Debug
set JAVA_OPTIONS=-Xdebug -Xrunjdwp:transport=dt_socket,address=8000,server=y,suspend=n

rem -----------------------------------------------------------------------------------------------------
echo ------ Info -------------
echo(
call jetty check
echo(
echo ------ Start ------------
echo(
echo To start Jetty Server from the command line, execute the following:
echo $ jetty -d start
echo or
echo $ jetty -d supervise
echo(
echo(
echo ------ Stop -------------
echo(
echo To stop Jetty Server, execute:
echo $ jetty -d stop
echo(
echo(
echo ------ Deploy -----------
echo(
echo If you copy the war file to %JETTY_HOME%\webapps\ then Jetty will attempt to (re)deploy it automatically:
echo $ copy yourFileApp.war %JETTY_HOME%\webapps\
echo(
echo(
echo ------ Debug ------------
echo(
echo The server is already on debug mode, then you have to configure your debugger to connect to localhost:8000
echo -----------------------------------------------------------------------------------------------------