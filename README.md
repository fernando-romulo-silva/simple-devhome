# simple-devhome

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Project status](https://img.shields.io/badge/Project%20status-Maintenance-orange.svg)](https://img.shields.io/badge/Project%20status-Maintenance-orange.svg)

## Project status

I change this project constantly, adding new scripts.

# About

These project was created to help developers start a "developer folder" on their machines. <br />
There are some scripts to download jdks (oracle, azul, etc), tools like Apache Ant, Apache Maven, etc., servers like Tomcat, Glassfish, and so on.
Not only create, but download, configure and set on environment variables.

# Technologies

- Bash (Shell)
- Batch File

# Install

Please follow these steps:

## Step 1

You have to create a folder to put the content, the "Development" folder (preferencially something like '/home/yourUser/Development' for Linux and 'C:\Users\yourUser\Development' for windows). <br />
The word 'yourUser' is a user name example. <br />

## Step 2

Next you have to create a user environment variable called "DEVELOPMENT_HOME" on your OS. <br />

### Linux

Execute on terminal ("gedit" is a text editor, you can use another):

```bash
gedit ~/.profile
```

Add this line:

```
export DEVELOPMENT_HOME="/home/yourUser/Development"
```

Save and close the profile then reload the terminal:

```bash
. ~/.profile
```

After that, check it:

```bash
echo $DEVELOPMENT_HOME
```

### Windows

For windows just press "Win + R", put the "rundll32.exe sysdm.cpl,EditEnvironmentVariables", and it will run the Environment Variables window immediately, now you can add:

```
name = DEVELOPMENT_HOME
value = C:\Users\yourUser\Development
```

Save and close, open another terminal and check it:

```bash
echo %DEVELOPMENT_HOME%
```

## Step 3

Then add the the script folder on your "PATH" environment var to access the commands on terminal:

### Linux

Execute on terminal ("gedit" is a text editor, you can use another):

```bash
gedit ~/.profile
```

Add this line:

```
export PATH="$DEVELOPMENT_HOME/scripts:$PATH"
```

Save and close the profile then reload the terminal:

```bash
. ~/.profile
```

After that check it:

```bash
echo $PATH
```
 
### Windows

For windows just press "Win + R", put the "rundll32.exe sysdm.cpl,EditEnvironmentVariables", and it will run the Environment Variables window immediately, find the "PATH" variable and add a new value, "%DEVELOPMENT%\scripts".

Open a terminal and check it:

```bash
echo %PATH%
```

## Step 4

Now get the code on the github: 

```bash
git clone https://github.com/fernando-romulo-silva/simple-devhome
```

## Step 5

Finally we need enter the "src" folder and execute the installation script.

### Linux

Execute on terminal:

```bash
cd simple-devhome/Development/src
```

And: 

```bash
sh start-development-folder.sh
```

### Windows

Execute on terminal:

```bash
cd simple-devhome\Development\src
```

And: 

```bash
start-development-folder.bat
```


# How to Use

This section you learn how to some stuff on your machine.
All script begins with 'set'.

# Java, Ant, Maven and Gradle

To install Java 17, Ant 1.10, Maven 3.8 and Gradle 7.5 execute:

## Linux

```bash
source set-java-17-oracle-hotspot.sh
```

## Windows

```bash
set-java-17-oracle-hotspot.bat
```

## Other Versions

For Java 17 version you can install these versions:  <br />

set-java-17-oracle-hotspot
set-java-17-azul-zulu
set-java-17-jetbrains-jbr-dcevm
set-java-17-oracle-graalvm
<br />
<br />
 
For Java 11 version you can install these versions: <br />

set-java-11-azul-zulu
set-java-11-travis-travaopen
set-java-11-oracle-graalvm
<br />
<br />

For Java 8 version you can install these versions: <br />

set-java-8-azul-zulu
set-java-8-azul-zulu-dcevm
<br />
<br />

For Java 7 version you can install these versions: <br />

set-java-7-azul-zulu
set-java-7-azul-zulu-dcevm
<br />
<br />

For Java 6 version you can install only this version: <br />

set-java-7-azul-zulu

