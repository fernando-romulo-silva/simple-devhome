@echo off
echo -----------------------------------------------------------------------------------------------------
echo Doc for Wildfly
echo 
echo ------ Info -------------
echo 
call standalone.bat --version
echo 
echo ------ Start ------------
echo 
echo To start Wildfly Server from the command line, execute the following:
echo $ standalone.bat
echo or
echo $ standalone.bat &
echo 
echo To restart:
echo $ jboss-cli.bat --connect command=:reload
echo 
echo 
echo ------ Stop -------------
echo 
echo To stop Wildfly Server, execute:
echo $ jboss-cli.bat --connect command=:shutdown
echo 
echo 
echo ------ Deploy -----------
echo 
echo If you copy the war/ear file to %WILDFLY_HOME%\standalone\deployments\ then Wildfly will attempt to (re)deploy it automatically:
echo $ copy yourFileApp.war %WILDFLY_HOME%\standalone\deployments\
echo 
echo 
echo ------ Debug ------------
echo 
echo To start the server in debug mode, use the --debug option as follows, default debug port is 8787:
echo $ standalone.bat --debug
echo or
echo $ standalone.bat --debug 9797
echo 
echo Then you have to configure your debugger to connect to localhost:8787
echo -----------------------------------------------------------------------------------------------------
