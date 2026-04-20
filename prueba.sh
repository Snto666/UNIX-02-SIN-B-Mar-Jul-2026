    1  git remote add upstream https://github.com/jonathanetitoo/UNIX-02-SIN-B-Mar-Jul-2026.git
    2  git fetch upstream
    3  git checkout -b eval_p2_1_v1 upstream/eval_p2_1_v1
    4  git push origin eval_p2_1_v1
    5  cd nebula/
    6  mv nebula/registros nebula/bitacoras
    7  cd ..
    8  mv nebula/registros nebula/bitacoras
    9  mv registros bitacoras
   10  mv nebula/registros nebula/bitacoras
   11  mkdir nebula/borradores
   12  git add .
   13  git commit -m "Fix problema 1: estructura de directorios corregida"
   14  mv nebula/cosmos.txt nebula/bitacoras/
   15  rm nebula/bitacoras
   16  mkdir nebula/bitacoras
   17  mv nebula/cosmos.txt nebula/bitacoras/
   18  mv nebula/estrella.bak nebula/estrella.conf
   19  git add .
   20  git commit -m "Fix problema 2: archivos movidos y renombrados"
   21  chmod 640 nebula/bitacoras/cosmos.txt
   22  git add .
   23  git commit -m "Fix problema 3: permisos numericos 640 en cosmos.txt"
   24  git remote set-url origin https://github.com/Snto666/UNIX-02-SIN-B-Mar-Jul-2026.git
   25  git push -u origin eval_p2_1_v1
   26  chmod u+x nebula/galaxia.sh
   27  chmod o-w nebula/estrella.conf
   28  git add .
   29  git commit -m "Fix problema 4: permisos simbolicos corregidos"
   30  chmod u+s nebula/galaxia.sh
   31  ls -l nebula/galaxia.sh
   32  git add .
   33  git commit -m "Fix problema 5: SUID activado en galaxia.sh"
   34  git push
   35  git add .
   36  git commit -m "Fix problema 5: SUID activado en galaxia.sh"
   37  git push --all
   38  git commit -m "Fix problema 5: SUID activado en galaxia.sh"
   39  git push --all
   40  chmod u+s nebula/galaxia.sh
   41  ls -l nebula/galaxia.sh
   42  git add .
   43  git commit -m "Fix problema 5: SUID activado en galaxia.sh"
   44  git push
   45  chmod +t /tmp/nebula_zone
   46  mkdir -p /tmp/nebula_zone
   47  chmod +t /tmp/nebula_zone
   48  git add .
   49  git commit -m "Fix problema 6: sticky bit en /tmp/nebula_zone"
   50  git push
   51  ls /tmp/
   52  ls -ld /tmp/nebula_zone
   53  chmod +t /tmp/nebula_zone
   54  git add .
   55  git commit -m "Fix problema 6: sticky bit en /tmp/nebula_zone"
   56  git commit --allow-empty -m "Fix problema 6: sticky bit en /tmp/nebula_zone"
   57  git commit --allow-empty -m "Fix problema 5SUID activado en galaxia.ss: 
git commit -m "Fix problema 6: sticky bit en /tmp/nebula_zone"
   58  history