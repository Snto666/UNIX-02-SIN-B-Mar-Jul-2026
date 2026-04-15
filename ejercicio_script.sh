echo '#!/bin/sh' > hola.sh #Create a file called hello.sh and write the text '#!/bin/sh'
echo 'echo "Hola desde mi primer script"' >> hola.sh #Add the text "Hello" from my first script to hola.sh without deleting the previous text
cat hola.sh #Show the text inside hola.sh
./hola.sh # Ejecut the script named hola.sh
ls -l hola.sh #We checked the permissions we had
chmod +x hola.sh #Give to hola.sh the necessary permissions.
ls -l hola.sh #We checked again what permissions the hola.sh have.
./hola.sh #He gives us what we requested, now with the necessary permission.
ls /etc #List the contents of the /etc directory
sudo touch /etc/prueba.txt #Create an empty file called "test.txt" inside the system folder /etc. It is necessary the sudo because we are touching the /etc
mkdir ~/mi_carpeta #Create a new folder called "my_folder" inside the home directory.
sudo apt install cowsay #The package manager downloads and installs the "cowsay" program using sudo.