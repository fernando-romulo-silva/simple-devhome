@echo off
echo -----------------------------------------------------------------------------------------------------
echo Doc for Glassfish
echo(
echo ------ Info -------------
echo(
 
call asadmin version

echo(
echo ------ Start ------------
echo( 
echo To start GlassFish Server from the command line, execute the following:
echo $ asadmin start-domain --verbose
echo or
echo $ asadmin start-domain --verbose domain1
echo or
echo $ asadmin start-domain domain1
echo(
echo A domain is a set of one or more GlassFish Server instances managed by one administration server. 
echo The following elements are associated with a domain:
echo * The GlassFish Server port number: The default is 8080
echo * The administration server's port number: The default is 4848
echo * An administration user name and password: The default user name is admin, and by default no password is required
echo(
echo(
echo ------ Stop -------------
echo(
echo To stop GlassFish Server, execute:
echo $ asadmin stop-domain domain1
echo(
echo(
echo ------ Deploy -----------
echo(
echo If you copy the war/ear file to %GLASSFISH_HOME%\domains\domain1\autodeploy\ then Glassfish will attempt to (re)deploy it automatically:
echo $ copy yourFileApp.war %GLASSFISH_HOME%\domains\domain1\autodeploy\ 
echo(
echo(
echo ------ Debug ------------
echo(
echo To start the server in debug mode, use the --debug option as follows:
echo $ asadmin start-domain --debug domain1
echo or
echo $ asadmin start-domain --verbose --debug domain1
echo(
echo Then you have to configure your debugger to connect to localhost:9009
echo -----------------------------------------------------------------------------------------------------