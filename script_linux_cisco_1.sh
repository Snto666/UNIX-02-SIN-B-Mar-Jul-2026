ls # Lists the files and directories in the current working directory
ls Documents # Lists the contents specifically within the 'Documents' folder
aptitude # A high-level interface for the package manager to install, remove, or update software
aptitude moo # Triggers a hidden Easter egg that claims there are no Easter eggs in this program
ls -l # Displays files using a long listing format, showing permissions, owner, and size
ls -r # Reverses the order of the directory listing
ls -lr # Lists files in long format and in reverse alphabetical order
aptitude -v moo # Increases verbosity to get a different response from the hidden Easter egg
aptitude -vv moo # Increases verbosity even further to continue the hidden dialogue
aptitude -vvv moo # High verbosity that finally reveals the hidden ASCII art "cow"
pwd # Displays the absolute path of the current working directory
cd # Changes the current directory to the user's home directory
cd Documents # Moves the current location to the 'Documents' directory
cd / # Changes the directory to the root (/), the top-level directory of the system
cd /home/sysadmin # Navigates to a specific absolute path: the home directory of 'sysadmin'
cd School/Art # Moves to a subdirectory using a relative path (School/Art)
cd ..   # Moves up one level in the directory tree to the parent directory
ls -l /var/log/ # Shows a detailed long list of files in the system log directory
ls -lt /var/log # Lists files in long format, sorted by modification time (newest first)
ls -l -S /var/log # Lists files in long format, sorted by file size (largest first)
ls -lSr /var/log # Lists files in long format, sorted by file size in reverse order (smallest first)
ls -r /var/log # Lists the directory contents in reverse alphabetical order
su # Switches the current user to the superuser (root)
exit # Closes the current terminal session or logs out of the current user
el siguiente ocmando es ocnfigurado de la sigiuente manera igual tienes que explicarlo (Para evitar ejecutar comandos sensibles o privilegiados, hemos configurado el comando steam locomotive, sl, para que requiera acceso administrativo. Si el comando se ejecuta como sysadmin, aparece un mensaje de error:

sysadmin@localhost:~$ sl
-bash: /usr/bin/sl: Permission denied)
sudo sl