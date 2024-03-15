# simple-devhome

[![License](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](https://opensource.org/licenses/Apache-2.0)
[![Project status](https://img.shields.io/badge/Project%20status-Maintenance-orange.svg)](https://img.shields.io/badge/Project%20status-Maintenance-orange.svg)

# Project status

I change this project constantly improving and adding new scripts, click [here](docs/STATUS.md) to follow up.

# The Problem

I worked in a company where losing everything on my PC was a routine, my workplace, libraries, config files, environment variables, etc.
And I had to recreate everything from scratch, it was tedious and time-consuming.

# About

These project was created to help developers start a "developer folder" on their machines. <br />
There are some scripts to download jdks (oracle, azul, etc), tools like Apache Ant, Apache Maven, etc., and servers like Tomcat, Glassfish, etc. and so on.
Not only create, but download, configure and set on environment variables. Similar to [SDkMAN](https://sdkman.io/), although more simpler.

# Technologies

Technologies used on this project:

- Bash Shell
- Batch File

# Requirements

To install you need the git installed on your pc, check it:

```bash
# check the git version
git --version
```
And access to Bash and Prompt command

# Install

You can install it on [Linux](docs/INSTALL-LINUX.md) or [Windows](docs/INSTALL-WINDOWS.md).

# How to Use

This section show how to use

## Concepts

To use these scripts you have to understand some concepts.
The scripts are following these structure: 

```bash
set-software-version\[-vendor][-codenome].[sh|bat]
```

Examples:

Install and/or config Oracle Java version 21, hotspot on Linux: 

```bash
. set-java-21-oracle-hotspot.sh
```

Install and/or config Jetbrains Java version 21, jbrdcevm on Windows:

```bash
set-java-17-jetbrains-jbrdcevm.bat
```

Install and/or config Tomcat 9 on Linux:

```bash
set-tomcat-9.0.sh
```

Install and/or config Jetty 12 on Windows:

```bash
set-jetty-12.0.bat
```

You can realize that in the Tomcat and Jetty scripts, there is no vendor; it is omitted because there is only one vendor for both Apache and Eclipse respectively.

## To Run

To run any script on linux:

```bash
source set-software-version\[-vendor][-codenome].sh
```
or

```bash
. set-software-version\[-vendor][-codenome].sh
```

And windows:

```bash
set-software-version\[-vendor][-codenome].bat
```

## What happening?

When you execute the script regardless the SO, what the script do:

- Download the software and put the download on '$DEVELOPMENT_HOME$\downloads' folder;
- Extract it on its directory; 
- Set the terminal/prompt command environment vars;
- Check the software;

Check the example, the ant script:

![Model](https://github.com/fernando-romulo-silva/simple-devhome/blob/master/docs/example01.png)

## Scripts

So far I provided some scripts, check it:

- [Java](docs/SET-JAVA.md)
- [Ant](docs/SET-ANT.md)
- Maven
- Gradle
- Tomcat
- Jetty
- Glassfish
- Wildfly
- Payara
