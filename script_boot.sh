cd #Change directory, changes the current working directory
cd /home/codespace #Use an absolute path to move the terminal session directly to the folder called codespace
cd ~ #It performs and allows a fast and efficient movement towards the root
cd $HOME  #It instantly transports the user to their root directory, regardless of their location.
sudo mkdir proyecto #Create a new folder called "project" using administrator privileges to bypass any permission restrictions on the system.
cd proyecto/ #Change the terminal's current working directory to place yourself within the "project" folder and begin working within it.
ls -lai #Displays the detailed contents of the directory, including hidden files, their system identification numbers (inodes), and access permissions.
total 8
925544 drwxr-xr-x 2 root root 4096 Apr  6 12:35 .
714616 drwxr-xr-x 1 root root 4096 Apr  6 12:35 ..
stat . #Displays detailed metadata of the current directory, such as its block size, inode, numeric permissions, user ID, and the exact dates of its last access or modification.
mkdir -p /tmp/prueba/sub1/tmp/prueba/sub2 #It recursively creates the entire nested directory structure, automatically generating intermediate folders if they do not exist.
stat /tmp/prueba #Displays technical information and specific metadata (permissions, inode, dates) only from the folder located at that path.
man mkdir #Manual with out internet for the mkdir function
pwd #Print the absolute path of the current working directory to know exactly where you are positioned in the system.
whoami #Displays the username of the current session to confirm which identity you are using to run the commands.
ls #Lists the names of the files and folders within the current directory
ls -l #Displays the directory contents in long list format, detailing permissions, owner, size, and modification date.
ls -la #List absolutely all elements, including hidden files with their technical details.
ls -lh #It presents the detailed list converting the file sizes.
ls -lt #Sorts the directory contents by modification date, showing the most recent files at the top of the list.
ls / #Displays the contents of the system's root directory.
ls /etc | head -20 # Lists system configuration files by filtering the output to show only the first 20 lines of results.
ls /dev | head -20 # Lists the system's hardware device files, limiting the display to the first 20 items found.