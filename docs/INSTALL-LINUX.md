# Install On Linux

To install on linux please follow these steps (tested on Ubuntu 20.20):

## Step 1

You have to create a folder to put the content, the "Development" folder, preferencially something like '/home/yourUser/Development'. <br />
The word 'yourUser' is a user name example.

## Step 2

Next you have to create a user environment variable called "DEVELOPMENT_HOME" on your OS. <br />
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

## Step 3

Then add the the script folder on your "PATH" environment var to access the commands on terminal. <br />
For that, execute the terminal ("gedit" is a text editor, you can use another):

```bash
gedit ~/.profile
```

Add/edit this line:

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
 
## Step 4

Now get the code on the github: 

```bash
git clone https://github.com/fernando-romulo-silva/simple-devhome
```

## Step 5

Finally you really NEED enter the "src/Development" folder and execute the installation script:

```bash
cd simple-devhome/src/Development
```

And: 

```bash
sh start-development-folder.sh
```
