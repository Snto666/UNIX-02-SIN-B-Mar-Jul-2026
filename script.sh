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
sudo echo "hola" | sudo tee /etc/archivo_protegido # #It writes "hello" into a file that requires administrator permissions, but it does display the message on the screen.