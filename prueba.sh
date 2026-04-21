    1  git fetch upstream
    2  git checkout -b eval_p2_1_v1 
    3  git push -u origin eval_p2_1_v1
    4  git push -f -u origin eval_p2_1_v1
    5  git fetch upstream
    6  git checkout -b eval_p2_1_v1 
    7  git push -u origin eval_p2_1_v1
    8  git fetch upstream
    9  git reset --hard upstream/eval_p2_1_v1
   10  git push -f origin eval_p2_1_v1
   11  mv nebula/registros nebula/bitacorasç
   12  mkdir nebula/borradores
   13  touch nebula/bitacoras/.gitkeep
   14  touch nebula/bitacoras/
   15  mkdir -p nebula/bitacoras
   16  mkdir -p nebula/borradores
   17  touch nebula/bitacoras/.gitkeep
   18  touch nebula/borradores/.gitkeep
   19  git add .
   20  git commit -m "Fix problema 1: estructura de directorios corregida"
   21  mv nebula/cosmos.txt nebula/bitacoras/
   22  mv nebula/estrella.bak nebula/estrella.conf
   23  git add .
   24  git commit -m "Fix problema 2: archivos movidos y renombrados"
   25  chmod 640 nebula/bitacoras/cosmos.txt
   26  git add .
   27  git commit -m "Fix problema 3: permisos numericos con chmod"
   28  chmod u+x nebula/galaxia.sh
   29  chmod o-w nebula/estrella.conf
   30  git add .
   31  git commit -m "Fix problema 4: permisos simbolicos corregidos"
   32  chmod u+s nebula/galaxia.sh
   33  ls -l nebula/galaxia.sh
   34  git add .
   35  git commit -m "Fix problema 5: SUID activado en galaxia.sh"
   36  chmod u+s nebula/galaxia.sh
   37  ls -l nebula/galaxia.sh
   38  git add .
   39  git commit -m "Fix problema 5: SUID activado en galaxia.sh"
   40  git commit --allow-empty -m "Fix problema 5: SUID activado en galaxia.sh"
   41  chmod +t /tmp/nebula_zone
   42  mkdir -p /tmp/nebula_zone
   43  chmod +t /tmp/nebula_zone
   44  ls -ld /tmp/nebula_zone
   45  git add .
   46  git commit --allow-empty -m "Fix problema 6: sticky bit en /tmp/nebula_zone"
   47  cat << EOF > generar_llave.txt
Key-Type: default
Subkey-Type: default
Name-Real: aurora
Name-Email: aurora@nebula.lab
Expire-Date: 0
%no-protection
%commit
EOF

   48  gpg --batch --generate-key generar_llave.txt
   49  rm generar_llave.txt
   50  gpg --trust-model always --encrypt --recipient aurora@nebula.lab nebula/bitacoras/cosmos.txt
   51  gpg --batch --passphrase "" --quick-gen-key aurora@nebula.lab rsa2048 default never
   52  gpg --list-keys aurora
   53  gpg --trust-model always --encrypt --recipient aurora@nebula.lab nebula/bitacoras/cosmos.txt
   54  gpg --batch --yes --delete-secret-keys aurora@nebula.lab
   55  gpg --batch --yes --delete-keys aurora@nebula.lab
   56  sudo gpg --batch --yes --delete-secret-keys aurora@nebula.lab
   57  gpg --batch --yes --delete-keys aurora@nebula.lab
   58  rm -rf ~/.gnupg
   59  cat << EOF > experto.txt
Key-Type: RSA
Key-Length: 2048
Subkey-Type: RSA
Subkey-Length: 2048
Name-Real: aurora
Name-Email: aurora@nebula.lab
Expire-Date: 0
%no-protection
%commit
EOF

   60  gpg --batch --generate-key experto.txt
   61  rm experto.txt
   62  gpg --list-keys aurora
   63  gpg --trust-model always --encrypt --recipient aurora@nebula.lab nebula/bitacoras/cosmos.txt
   64  git add .
   65  git commit -m "Fix problema 7: llave GPG generada y cosmos.txt cifrado"
   66  gpg --verify nebula/galaxia.sh.sig nebula/galaxia.sh
   67  gpg --batch --yes --clearsign --local-user aurora@nebula.lab --output nebula/estrella.conf.asc nebula/estrella.conf
   68  gpg --batch --yes --detach-sign --local-user aurora@nebula.lab --output nebula/galaxia.sh.sig nebula/galaxia.sh
   69  gpg --verify nebula/galaxia.sh.sig nebula/galaxia.sh
   70  git add .
   71  git commit -m "Fix problema 8: firmas GPG corregidas y creadas"
   72  git push origin eval_p2_1_v1
   73  history