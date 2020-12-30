#!/bin/bash
echo "========================================================================="
echo "Starting the development home"

echo $DEVELOPMENT_HOME

# check the DEVELOPMENT_HOME variable
result=$(scripts/linux/internal/check-develpment-folder.sh)
if [ -z "${result##*error*}" ] ; then
  echo $result
  exit 1
else
  echo $result
fi

# check if the Development folder exists
if [ ! -d "$DEVELOPMENT_HOME" ]; then
	mkdir -p $DEVELOPMENT_HOME
fi

# copy the structure of folder, just the important
rsync -av --progress . /$DEVELOPMENT_HOME --exclude scripts --exclude '*.bat' --exclude 'start-development-folder.sh'

# copy the scripts,
cp -rf scripts/linux/* $DEVELOPMENT_HOME/scripts/ 

# current dir's backup
back=$(pwd)

# got to linux scripts folder
cd $DEVELOPMENT_HOME/scripts/

# create sh files to call folder's scripts batch
for d in *; do
    if [ -d "${d}" ] && [ ! $d = "internal" ] && [ ! $d = "*doc*" ]; then
       cd $d

       for f in *.sh; do
           echo ". $DEVELOPMENT_HOME/scripts/$d/$f" > $DEVELOPMENT_HOME/scripts/$f           
           chmod +x $DEVELOPMENT_HOME/scripts/$d/$f
           chmod +x $DEVELOPMENT_HOME/scripts/$f
           ln -f -s $DEVELOPMENT_HOME/scripts/$f $HOME/.local/bin/$f
       done
               
       cd ..
    fi
done

# go back
cd $back

echo "========================================================================="
# https://stackoverflow.com/questions/2999448/executing-shell-script-without-calling-sh-implicitly
# find $DEVELOPMENT_HOME -type f -iname "*.sh" -exec chmod +x {} \;
