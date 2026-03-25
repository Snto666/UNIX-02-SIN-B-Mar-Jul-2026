uname -a #Displays detailed system information, including the kernel version and operating system architecture.
which gpg #Locates the executable path of the GPG program to confirm it is installed and see where it lives.
gpg --version #Checks the version number and supported algorithms of GPG.
gpg --full-generate-key #Starts the interactive process to create a new key pair (public and private) with custom options like key type and expiration date.
gpg --list-keys #Lists all public keys currently stored in my "keyring."
gpg --armor --export santiagoyambay123@gmail.com > mi_llave_publica.asc #Exports my public key in a readable text format (ASCII armor) and saves it to a file so you can share it with others.
gpg --list-secret-keys --keyid-format=long #Lists my private (secret) keys and displays their IDs in a detailed, long format.
gpg --armor --export-secret-keys XXXXXXXXXX (FEBDE2535840B779) #Exports my private key.
gpg --import llave_et.asc #(llave_et.asc=file where the colleague's public key was stored) #Adds a friend's public key to my keyring so you can send them encrypted messages.
$ echo "ey ey ey pokkie, do not say that, you are beautiful" > doc_no_cifrado.txt # Creates a simple text file with the content you typed.
gpg --output doc_cifrado.txt --encrypt --recipient 3A07743689378D211DE90B9C2E2EAF7C82661FC2 doc_no_cifrado.txt #Encrypt the previously saved message and send it encrypted to my colleague's key.
gpg --decrypt estpu_doc_cifrado.txt #Decrypt the message sent by my colleague so that his message can now be read
gpg --output doc_no_cirfrado_firmado.txt --clearsign doc_no_cifrado.txt #Clear sign, it doesn't give binary or strange characters, only text
ls #Lists the files in my current directory.
cat doc_no_cifrado.txt #Displays the content of the file directly in your terminal
gpg --verify santiago_doc_no_cifrado_firmado.txt #Verifies the digital signature of the file to confirm its authenticity and ensure it hasn't been tampered with.
gpg --edit-key BF8A9258824D7DC2D83D51DBFEBDE2535840B779 #Opens an interactive menu to manage, edit, or sign the specific GPG key identified by that fingerprint.
gpg> trust #This sub-command allows you to set the level of confidence you have in the key owner's ability to accurately validate other people's keys.
gpg --sign-key BF8A9258824D7DC2D83D51DBFEBDE2535840B779 #Use your private key to digitally sign the specified public key, officially certifying that you have verified the owner's identity.
gpg --output doc_no_cifrado_firmado_binario.txt --sign doc_no_cifrado.txt #Creates a compressed binary file that contains both the original content and your digital signature.
gpg --output doc_no_cifrado_firmado_binario.txt --sign doc_no_cifrado.txt #creates a compressed binary file that contains both the original content and your digital signature.
gpg --verify es-ndoc_no_cifrado_firmado_binario.txt #extracts the original data from the binary file and checks the digital signature to confirm who signed it and that it hasn't been changed.
gpg --output firma_separada_doc_no_cifrado.sig --detach-sign doc_no_cifrado.txt #creates a "detached" signature file that contains only the digital signature of the document, leaving the original file completely untouched.