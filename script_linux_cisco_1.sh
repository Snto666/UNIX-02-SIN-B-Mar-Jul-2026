#2) Sintaxis de comandos básicos
ls # Lists the files and directories in the current working directory
#2.1) Argumentos
ls Documents # Lists the contents specifically within the 'Documents' folder
aptitude # A high-level interface for the package manager to install, remove, or update software
aptitude moo # Triggers a hidden Easter egg that claims there are no Easter eggs in this program
#2.2) Opciones
ls -l # Displays files using a long listing format, showing permissions, owner, and size
ls -r # Reverses the order of the directory listing
ls -lr # Lists files in long format and in reverse alphabetical order
aptitude -v moo # Increases verbosity to get a different response from the hidden Easter egg
aptitude -vv moo # Increases verbosity even further to continue the hidden dialogue
aptitude -vvv moo # High verbosity that finally reveals the hidden ASCII art "cow"
#3) Imprimir el directorio de trabajo
pwd # Displays the absolute path of the current working directory
#4) Cambio de Directorios
cd # Changes the current directory to the user's home directory
cd Documents # Moves the current location to the 'Documents' directory
cd / # Changes the directory to the root (/), the top-level directory of the system
cd /home/sysadmin # Navigates to a specific absolute path: the home directory of 'sysadmin'
cd School/Art # Moves to a subdirectory using a relative path (School/Art)
cd ..   # Moves up one level in the directory tree to the parent directory
#5) Listados de archivos
ls # Lists the files and directories in the current working directory
ls -l /var/log/ # Shows a detailed long list of files in the system log directory
ls -lt /var/log # Lists files in long format, sorted by modification time (newest first)
ls -l -S /var/log # Lists files in long format, sorted by file size (largest first)
ls -lSr /var/log # Lists files in long format, sorted by file size in reverse order (smallest first)
ls -r /var/log # Lists the directory contents in reverse alphabetical order
#6) Acceso administrativo
su - # Switches the current user to the superuser (root)
exit # Closes the current terminal session or logs out of the current user
sudo sl # Runs the 'Steam Locomotive' command with administrative privileges using sudo
#7) Permisos
cd ~/Documents # Navigates to the Documents folder in the home directory
ls -l hello.sh  # Lists long format details for the specific file 'hello.sh'
#8) Cambiar los permisos de los archivos
cd ~/Documents # Navigates to the Documents folder in the home directory
ls -l hello.sh # Lists long format details for the specific file 'hello.sh'
./hello.sh # Attempts to execute the 'hello.sh' script in the current directory
chmod u+x hello.sh # Grants execution permissions to the owner (user) of the file
ls -l hello.sh # Lists long format details for the specific file 'hello.sh' 
./hello.sh # Attempts to execute the 'hello.sh' script in the current directory
#9) Cambiar el propietario de un archivo
cd ~/Documents # Navigates to the Documents folder in the home directory
ls -l # Displays files using a long listing format, showing permissions, owner, and size
sudo chown root hello.sh # Changes the owner of 'hello.sh' to the root user using administrative privileges
ls -l hello.sh # Lists long format details for the specific file 'hello.sh' 
./hello.sh # Attempts to execute the 'hello.sh' script in the current directory
sudo ./hello.sh # Runs the script 'hello.sh' with root privileges using sudo
#10) Visualización de archivos 
cd ~/Documents # Navigates to the Documents folder in the home directory
cat animals.txt # Prints the entire content of 'animals.txt' to the terminal 
cat alpha.txt # Prints the entire content of 'alpha.txt' to the terminal
head alpha.txt # Displays the first 10 lines of 'alpha.txt' by default
tail alpha.txt # Displays the last 10 lines of 'alpha.txt' by default
head -n 5 alpha.txt # Shows specifically the first 5 lines of the file
tail -n 5 alpha.txt # Shows specifically the last 5 lines of the file
#11) Copiar archivos 
cd ~/Documents # Navigates to the Documents folder in the home directory
cp /etc/passwd . # Copies the system's password file to the current directory (.)
ls # Lists the files and directories in the current working directory
#11.1) Copiar archivos 
cd ~ # Changes the current working directory to the user's home directory
dd if=/dev/zero of=/tmp/swapex bs=1M count=50 