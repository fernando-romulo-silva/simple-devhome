#!/bin/bash
echo "-----------------------------------------------------------------------------------------------------"
echo "Doc for Jetty"
echo ""

# -----------------------------------------------------------------------------------------------------
# Open to Debug
export JAVA_OPTIONS="-Xdebug -Xrunjdwp:transport=dt_socket,address=8000,server=y,suspend=n"

# -----------------------------------------------------------------------------------------------------
echo "------ Start ------------"
echo ""
echo "To start Jetty Server from the command line, execute the following:"
echo "$ jetty.sh -d start"
echo "or"
echo "$ jetty.sh -d supervise"
echo ""
echo ""
echo "------ Stop -------------"
echo ""
echo "To stop Jetty Server, execute:"
echo "$ jetty.sh -d stop"
echo ""
echo ""
echo "------ Deploy -----------"
echo ""
echo "If you copy the war file to JETTY_HOME/webapps/ then Jetty will attempt to (re)deploy it automatically:"
echo "$ cp yourFileApp.war JETTY_HOME/webapps/"
echo ""
echo ""
echo "------ Debug ------------"
echo ""
echo "The server is already on debug mode, then you have to configure your debugger to connect to localhost:8000"
echo "-----------------------------------------------------------------------------------------------------"
