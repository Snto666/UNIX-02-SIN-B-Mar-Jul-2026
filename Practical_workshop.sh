uname -a
which gpg
gpg --full-generate-key
gpg --list-keys // lsito todas las llaves que tengo
gpg --armor --export santiagoyambay123@gmail.com > mi_llave_publica.asc
gpg --armor-export //
gpg --version
gpg --list-secret-keys --keyid-format=long
gpg --armor --export-secret-keys XXXXXXXXXX (FEBDE2535840B779)
gpg --import llave_et.asc //(llave_et.asc=archivo donde se guardo la llave publica del compañero)
