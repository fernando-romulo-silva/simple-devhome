============================================================================================================================
put you export variable on Linux

1º Edit environment files 

Environment User File

$ gedit ~/.profile

or

$ gedit ~/.bashrc


Envionment System File

$ sudo gedit /etc/profile

===========================================================================================================================
2º Add var

export YOUR_VAR=value-of-var

export PATH="$YOUR_VAR/bin:$PATH"

Ex:

export DEVELOPMENT_HOME="/home/fernando/Development"

export DOCKER_VOLUMES_HOME="$DEVELOPMENT_HOME/files/dockerVolumes"

export JAVA_HOME="$DEVELOPMENT_HOME/languages/java/jdk17-oracle-hotspot"

export ANT_HOME="$DEVELOPMENT_HOME/tools/apache-ant/apache-ant-1.10.9"
export ANT_ARGS="-logger org.apache.tools.ant.listener.AnsiColorLogger"
export ANT_OPTS="-Xms256M -Xmx512M"

export M2_HOME="$DEVELOPMENT_HOME/tools/apache-maven/apache-maven-3.8.2"

export GRADLE_HOME="$DEVELOPMENT_HOME/tools/gradle/gradle-6.9.1"

export PATH="$JAVA_HOME/bin:$ANT_HOME/bin:$M2_HOME/bin:$GRADLE_HOME/bin:$DEVELOPMENT_HOME/scripts:$PATH"

============================================================================================================================

3º For reset and  your enviroment variables

$ . ~/.profile

or

$ . ~/.bashrc

or

$ . /etc/.profile


============================================================================================================================

4º To run make sh files runnable

chmod +x  file.sh

chmod +x  *.sh


============================================================================================================================

5º to execute the sh file, use the "dot space script" calling syntax. :

$ . script.sh
