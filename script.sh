ls -a 
# Syntax: ls
#Explanation: -a tells the terminal to show all files, including hidden ones
ls --all 
#Syntax: ls
#Explanation: --all tells the terminal to show all files, including hidden ones
ls -a /
#Syntax: ls 
#Explanation: -a / this command lists all files and directories located in the root directory.
ls -l -a -h 
#Syntax: ls
#Explanation: -l -a -h Lists all files in a detailed long format with file sizes in humanreadable units (KB, MB, GB).
ls -l -ah
#Syntax: ls
#Explanation: -l -ah It displays a list of all files in a long, detailed format, with file sizes in units.
ls -lah
#Syntax: ls
##Explanation: -lah It displays a list of all files in a long, detailed format, with file sizes in units.
mkdir -- -rf
#Syntax: mkdir 
#Explanation: -- -rf  create a  directory named "-rf" .
rmdir -- -rf
#Syntax: mkdir
#Explanation: -- -rf removes the specific directory named "-rf"
ls --help
#Syntax: ls 
#Explanation: --help displays a complete manual and list of options for the ls command  in the terminal
man ls 
#Syntax: man 
#Explanation: ls open the manual page for the ls command, provide a guide that details every option, argument, and technical behavior.
--depth 
#--depth <depth>
        #Create a shallow clone with a history truncated to the specified number of commits. Implies --single-branch unless --no-single-branch is given to fetch the
        #histories near the tips of all branches. If you want to clone submodules shallowly, also pass --shallow-submodules.
chmod
#Syntax: chmod 
#Explanation: Changes the access permissions of a file or directory for the owner, the group, and others.
chmod +x script.sh
#Syntax: chmod 
#Explanation: Adds execute permission to the file for all users like owner, group, and others) by default.

chmod u+x script.sh
#Syntax: chmod 
#Explanation: Grants execute permission exclusively to the owner user of the script, leaving other permissions unchanged.

chmod o-r secreto.txt
#Syntax: chmod 
#Explanation: Removes read permission from others everyone else who isn't the owner or in the file's group. 
chmod u=rw,go= privado
#Syntax: chmod 
#Explanation: Grants the owner read and write access while stripping all permissions from the group and others, making the file strictly private.
sudo echo "hola" > /etc/archivo_protegido #This command is missing sudo permission in its second part, because without it, the command does not work correctly.
sudo echo "hola" | sudo tee /etc/archivo_protegido > /dev/null #It writes "hello" into a file that requires administrator permissions, but it doesn't display anything on the screen.
cat /etc/archivo_protegido #It shows the contents of the file on the screen.
sudo echo "hola" | sudo tee /etc/archivo_protegido #It writes "hello" into a file that requires administrator permissions, but it does display the message on the screen.
sudo sh -c 'echo "chao" >> /etc/archivo_protegido' #The command causes a new terminal with administrator privileges to execute the complete instruction to add text to the end of the file without deleting what already existed.
sudo su - #The current session will become a superuser session.
echo "$HOME" # Give us /home/codespace. This one give us the route-expand the variable.
echo '$HOME' # Give us echo '$HOME'.This one is like a string, just give us the mesage between the ' '
umask # Give us the level of permissions what we have on our codespace.
touch archivo1 #Create an empty file called archivo1.
mkdir diretorio1 #Create a new directory called diretorio1.
ls -l #Displays a list of the current directory files and folders detailing permissions, owner, size, and date.
total 64
-rw-rw-rw-  1 codespace root      34523 Apr 27 12:07 LICENSE
-rw-rw-rw-  1 codespace root         70 Apr 27 12:07 README.md
-rw-rw-rw-  1 codespace codespace     0 Apr 27 12:31 archivo1
drwxrwxrwx+ 2 codespace codespace  4096 Apr 27 12:31 diretorio1
-rw-rw-rw-  1 codespace root        963 Apr 27 12:07 ejercicio1.sh
-rw-rw-rw-  1 codespace root        481 Apr 27 12:07 ejercicio2.sh
-rwxrwxrwx  1 codespace root        159 Apr 27 12:07 hola.sh
-rwxrwxrwx  1 codespace root          0 Apr 27 12:07 prueba.txt
-rwxrwxrwx  1 codespace root       3394 Apr 27 12:31 script.sh
-rw-rw-rw-  1 codespace root         28 Apr 27 12:07 sudo
umask 027 # Removes all permissions from others and write permissions from group.
touch archivo2 # Create the file by applying the mask (it will look like -rw-r-----).
mkdir diretorio2 # Create the folder by applying the mask (it will look like drwxr-x---).
ls -l # It displays a list of the current directory files and folders detailing permissions, owner, size, and date.
total 68
-rw-rw-rw-  1 codespace root      34523 Apr 27 12:07 LICENSE
-rw-rw-rw-  1 codespace root         70 Apr 27 12:07 README.md
-rw-rw-rw-  1 codespace codespace     0 Apr 27 12:31 archivo1
-rw-rw-rw-  1 codespace codespace     0 Apr 27 12:35 archivo2
drwxrwxrwx+ 2 codespace codespace  4096 Apr 27 12:31 diretorio1
drwxrwxrwx+ 2 codespace codespace  4096 Apr 27 12:35 diretorio2
-rw-rw-rw-  1 codespace root        963 Apr 27 12:07 ejercicio1.sh
-rw-rw-rw-  1 codespace root        481 Apr 27 12:07 ejercicio2.sh
-rwxrwxrwx  1 codespace root        159 Apr 27 12:07 hola.sh
-rwxrwxrwx  1 codespace root          0 Apr 27 12:07 prueba.txt
-rwxrwxrwx  1 codespace root       3431 Apr 27 12:34 script.sh
-rw-rw-rw-  1 codespace root         28 Apr 27 12:07 sudo
sudo apt-get update # Updates the list of packages available in the repositories
sudo apt-get install acl # Install the Access Control Lists (ACL) tool.
sudo chown -R $(whoami) . # It makes us the owner of all files and folders in the current directory.
sudo setfacl -bnR . # Removes all extended permission rules (ACLs) recursively
