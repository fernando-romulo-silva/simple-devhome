# simple-devhome

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Project status](https://img.shields.io/badge/Project%20status-Maintenance-orange.svg)](https://img.shields.io/badge/Project%20status-Maintenance-orange.svg)

## Project status

I change this project constantly, adding new scripts.

# About

This project create a folder with all tools that I usually use on my daily work. <br />
Not only create, but download, configure and set on environment using scripts.

# Technologies

- Bash (Shell)
- Batch File

# Install

First, you need the correct OS (windows or Linux) and the git installed. <br />
Then you need a new folder to put the scripts, and set the path folder on DEVELOPMENT_HOME environment. <br />
It's usually something like:

```bash
/home/yourUser/Development
```
or

```bash
C:\Users\yourUser\Development
```
Now execute:

```bash
# clone it
git clone https://github.com/fernando-romulo-silva/simple-devhome

# access the project folder
cd simple-devhome/src/Development

# for linux users

## check the DEVELOPMENT_HOME
echo $DEVELOPMENT_HOME

## start the script
sh start-development-folder.sh

# for windows users

## check the DEVELOPMENT_HOME
echo %DEVELOPMENT_HOME%

## start the script
start-development-folder.bat

```

# How to Use

Just execute on terminal:

```bash
# for linux users:
## configure java 8, apache-ant-1.10.5, apache-maven-3.6.0 and gradle-5.1.1
 . set-java-zulu-8.sh

```