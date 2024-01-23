# Install On Windows

To install on Windows please follow these steps (tested on Windows 7 e 10):

## Step 1

You have to create a folder to put the content, the "Development" folder, preferencially something like 'C:\Users\yourUser\Development' for windows. <br />
The word 'yourUser' is a user name example.

## Step 2

Next you have to create a user environment variable called "DEVELOPMENT_HOME". <br />
For that just press "Win + R", put the "rundll32.exe sysdm.cpl,EditEnvironmentVariables", and it will run the Environment Variables window immediately, now you can add it (USER Variables):

```
name = DEVELOPMENT_HOME
value = C:\Users\yourUser\Development
```

Save and close, open another terminal and check it:

```bash
echo %DEVELOPMENT_HOME%
```

## Step 3

Then add the the script folder on your "PATH" environment var to access the commands on terminal. <br />
For that just press "Win + R", put the "rundll32.exe sysdm.cpl,EditEnvironmentVariables", and it will run the Environment Variables window immediately, find the "PATH" variable and add a new value, "%DEVELOPMENT_HOME%\scripts".

Open a Command Promp, "Win + R" and put the "cmd" and it will open a Command Prompt. Now check it:

```bash
echo %PATH%
```

## Step 4

Now get the code on the github: 

```bash
git clone https://github.com/fernando-romulo-silva/simple-devhome
```

## Step 5

Finally you really NEED enter the "src\Development" and execute the installation script:

```bash
cd simple-devhome\src\Development
```

And: 

```bash
start-development-folder.bat
```