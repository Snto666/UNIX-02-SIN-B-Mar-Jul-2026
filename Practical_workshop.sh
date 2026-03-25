uname -a
which gpg
gpg --full-generate-key
gpg --list-keys // listo todas las llaves que tengo
gpg --armor --export santiagoyambay123@gmail.com > mi_llave_publica.asc
gpg --armor-export //
gpg --version
gpg --list-secret-keys --keyid-format=long
gpg --armor --export-secret-keys XXXXXXXXXX (FEBDE2535840B779)
gpg --import llave_et.asc //(llave_et.asc=archivo donde se guardo la llave publica del compañero)
$ echo "ey ey ey pokkie, do not say that, you are beautiful" > doc_no_cifrado.txt // explicar que hace
gpg --output doc_cifrado.txt --encrypt --recipient 3A07743689378D211DE90B9C2E2EAF7C82661FC2 doc_no_cifrado.txt #cifra el mensaje previamente guardado y lo envia encriptado hacia la llave de mi compañero
gpg --decrypt estpu_doc_cifrado.txt #desencripta el mensaje enviao por mi compañero de manera que ya se puede leer su mensaje
gpg --output doc_no_cirfrado_firmado.txt --clearsign doc_no_cifrado.txt #Clear sign, no da binario  ni signos extraños, solo texto