#!/bin/bash
echo "-----------------------------------------------------------------------------------------------------"
echo "Doc for Tomcat"
echo ""

# -----------------------------------------------------------------------------------------------------
# Open to Debug
export CATALINA_OPTS="-Xdebug -Xrunjdwp:transport=dt_socket,address=8000,server=y,suspend=n"
export JPDA_OPTS="-agentlib:jdwp=transport=dt_socket,address=8000,server=y,suspend=n"

# -----------------------------------------------------------------------------------------------------
echo "------ Start ------------"
echo ""
echo "To start Tomcat Server from the command line, execute the following:"
echo "$ sh startup.sh"
echo "or"
echo "$ catalina.sh run"
echo ""
echo ""
echo "------ Stop -------------"
echo ""
echo "To stop Tomcat Server, execute:"
echo "$ shutdown.sh"
echo ""
echo ""
echo "------ Deploy -----------"
echo ""
echo "If you copy the war file to CATALINA_HOME/webapps/ then tomcat will attempt to (re)deploy it automatically:"
echo "$ cp yourFileApp.war CATALINA_HOME/webapps/"
echo ""
echo ""
echo "------ Debug ------------"
echo ""
echo "The server is already on debug mode, then you have to configure your debugger to connect to localhost:8000"
echo "-----------------------------------------------------------------------------------------------------"
