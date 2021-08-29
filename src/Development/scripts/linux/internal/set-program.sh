#!/bin/bash
# download and install zip, tar.gz and other files
url="$1"
final_name="$2"
dest="$3"
var_name="$4"
current_name="$2"

echo "-----------------------------------------------------------------------------------------------------"
echo "set the program $final_name, please wait"

# -----------------------------------------------------------------------------------------------------
# set Download home
dev_folder_downloads=$DEVELOPMENT_HOME/downloads

# check HOME/Downloads/DevDownloads exists, if not, create it
mkdir -p $dev_folder_downloads

# check DEVELOPMENT_HOME/dest exists, if not, create it
mkdir -p $DEVELOPMENT_HOME/$dest

# -----------------------------------------------------------------------------------------------------
# get the serve file name
server_file_temp="${url##*/}"

# remove parameters on url
if [ ${server_file_temp=~ .*?.*} ] ; then
   server_file="${server_file_temp?*}"   
else
   server_file=$server_file_temp
fi

# TODO get the extension, "tar.bz2", "bz2", "rar" ? 
if [ -z "${server_file##*.tar.gz*}" ] ; then
   extension="tar.gz"
else  
   extension="${server_file##*.}"
fi

# -----------------------------------------------------------------------------------------------------
# is the program already installed?
if [ ! -d "$DEVELOPMENT_HOME/$dest/$final_name" ] ; then

   # is the file already download?
   if [ ! -f "$dev_folder_downloads/$final_name.$extension" ] ; then
   	  # download it!
      wget -O $dev_folder_downloads/$final_name.$extension $url	
   fi
   
   # if it's a compressed file?
   if [ $extension = "zip" ] ; then
      
      # get the folder's name inside
      current_name=$(unzip -Z -1 $dev_folder_downloads/$final_name.$extension | head -1)
      
      # uncompress it!
      unzip -q $dev_folder_downloads/$final_name.zip -d $dev_folder_downloads
         
   elif [ $extension = "tar.gz" ] ; then
      
      # get the folder's name inside
      current_name=$(tar tzf $dev_folder_downloads/$final_name.$extension | sed -e 's@/.*@@' | uniq)
      
      # uncompress it!
      tar xf $dev_folder_downloads/$final_name.tar.gz -C $dev_folder_downloads
      
   else
      
      # create program folder
      mkdir -p $dev_folder_downloads/$final_name
      
      # copy it into
      cp -fr $dev_folder_downloads/$final_name.$extension $dev_folder_downloads/$final_name
   fi
   
   # -----------------------------------------------------------------------------------------------------
   # is the folder extracted equals to final name?
   # if [ ! -d "$dev_folder_downloads/$final_name" ] ; then
   if [ ! $final_name = $current_name ] ; then
   	
      # rename compacted folder to final folder
      mv $dev_folder_downloads/$current_name $dev_folder_downloads/$final_name
   fi
   
   # -----------------------------------------------------------------------------------------------------
   # copy the program folder to dest
   mv $dev_folder_downloads/$final_name $DEVELOPMENT_HOME/$dest/$final_name
   
   # granting permissions
   chmod -R 755 $DEVELOPMENT_HOME/$dest/$final_name
fi

# -----------------------------------------------------------------------------------------------------
# check if it need declare a home environment variable
if [ ! -z "$var_name" ] ; then
   
   # set program environment variable
   export $var_name=$DEVELOPMENT_HOME/$dest/$final_name
   
   # add the path
   if [ -d "$DEVELOPMENT_HOME/$dest/$final_name/bin" ] ; then
      export PATH=$DEVELOPMENT_HOME/$dest/$final_name/bin:$PATH
   else
      export PATH=$DEVELOPMENT_HOME/$dest/$final_name:$PATH
   fi
     
   # TODO create a sh file to call a executable or just a shortcut 
   if [ $extension = "jar" ] ; then
      echo "java -jar $final_name.jar" > $dev_folder_downloads/$final_name/$final_name.sh
   fi
   
   echo "Home variable is $var_name"
fi

echo "Software $final_name installed in $DEVELOPMENT_HOME/$dest/$final_name"
echo " "

# echo "=========================================================================="
# echo "FOR DEBUGGING"
# echo "extension = $extension" 
# echo "final_name = $final_name"
# echo "Home = $HOME"
# echo "dev_folder_downloads = $dev_folder_downloads" 
# echo "current_name = $current_name"
# echo "url = $url"
# echo "server_file = $server_file"
# echo "server_file_temp = $server_file_temp"
# echo "var_name = $var_name"
# echo "=========================================================================="
