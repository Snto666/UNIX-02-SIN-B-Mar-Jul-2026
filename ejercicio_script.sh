echo '#!/bin/sh' > hola.sh #Create a file called hello.sh and write the text '#!/bin/sh'
echo 'echo "Hola desde mi primer script"' >> hola.sh #Add the text "Hello" from my first script to hola.sh without deleting the previous text
cat hola.sh #Show the text inside hola.sh
./hola.sh
ls -l hola.sh #We checked the permissions we had
chmod +x hola.sh # Give to hola.sh the necessary permissions.
ls -l hola.sh
