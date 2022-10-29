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

You have to create a folder to put the content, the "Development" folder (preferencially something like '/home/yourUser/Development' for Linux and 'C:\Users\yourUser\Development'). <br />
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

For that:

```bash
cd simple-devhome/Development/src
```

And execute: 

```bash
sh start-development-folder.sh
```

### Windows

For that execute:

```bash
cd simple-devhome\Development\src
```

And execute: 

```bash
start-development-folder.bat
```


# How to Use

This section you learn how to some stuff on your machine.

## Java, Ant, Maven and Gradle

### Java 17

To install Java 17 and Ant, Maven and Gradle execute:

#### Linux

```bash
source set-java-17-oracle-hotspot.sh
```

#### Windows

```bash
set-java-17-oracle-hotspot.bat
```

For Java 17 version you will install you can change 'oracle-hotspot' for:

oracle-hotspot
azul-zulu
jetbrains-jbr-dcevm
oracle-graalvm

### Java 11

To install Java 11 and Ant, Maven and Gradle execute:

#### Linux

```bash
source set-java-11-azul-zulu.sh
```

#### Windows

```bash
set-java-11-azul-zulu.bat
```

For Java 11 version you will install you can change 'oracle-hotspot' for:

azul-zulu
travis-travaopen
oracle-graalvm
