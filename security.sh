id #Displays the current user's UID (User ID), GID (Group ID), and groups.
cat /etc/passwd | head -10 # Reads the user account list and displays only the first 10 lines.
groups # Lists all the groups the current user belongs to.
groups $USER # Specifically queries and lists the groups for the username stored in the environment variable $USER
id -u #Prints the effective user ID (numeric UID) only.
id -g # Prints the effective group ID (numeric GID) only.
id -G # Prints all group IDs (supplementary GIDs) associated with the user.
cat /etc/group |  grep root # Searches for the string "root" within the group definition file to show its GID and members.
cat /etc/gshadow # Displays the file containing encrypted group passwords and group administrators (usually requires root/sudo access).
mkdir ~/proyecto_unix/ # Creates a new directory named "proyecto_unix" inside your home folder (~).
ls -la ~/proyecto_unix/ # Lists all contents including hidden files of the project folder in a long format with detailed permissions
# groupadd [options] group_name
# Create a simple group
sudo groupadd developers #Creates a new user group named developers.
sudo groupadd -g 2000 operations  # Specific GID #Creates group operations with specific GID 2000.
# System group (GID < 1000)
sudo groupadd --system web_services #Creates a system group with low GID
# Verify that they were created
grep "desarrolladores\|operaciones\|servicios_web" /etc/group
grep -E "desarrolladores|operaciones|servicios_web" /etc/group
# View main options
groupadd --help #Displays manual and options for groupadd command.
# View the range of GIDs in the system
grep "GID _MINI\|GID_MAX\|SYS_GID" /etc/login.defs
# View the range of GIDs in the system
# In Ubuntu typically:
#SYS_GID_MIN = 100
#SYS_GID_MAX = 999
#GID_MIN = 1000
#GID_MAX = 600000
# addgroup [options] nombre _grupo
# Create groups with addgroup
sudo addgroup diseno
sudo addgroup --gid 2100 marketing #Creates group marketing with GID 2100.
sudo addgroup --system cache_web #Creates a new system group via addgroup.
#Verify
grep "diseno\|marketing\|cache_web" /etc/group
# Ver a qué grupos pertenece el usuario actual
groups #Lists all groups the current user belongs to.
id #Displays user identity, UID, and all group IDs.
# Agregar usuario a un grupo con usermod (bajo nivel)
sudo usermod -aG desarrolladores root #We usea root beacuse the $HOME doesn't have anything inside, so we hae to change it to "root"
sudo usermod -aG diseno root
# CRITICAL: the -a (append) flag is fundamental
# Without -a, usermod REPLACES all user groups
# With -a, ADDS the user to the group while keeping existing groups
# Verify change in /etc/group
grep "desarrolladores\|diseno" /etc/group
# Add user to group with adduser (high level, Debian)
sudo adduser root marketing
# View current status
id root
grep root /etc/group
# Create a temporary group for the demo
sudo groupadd grupo_temporal
sudo usermod -aG grupo_temporal root
id root # Have grupo_temporal
# Now the ERROR: usermod with out -a
sudo usermod -G desarrolladores root
# This REMOVES all child groups except developers
id root # lost all other groups
#Restore
sudo usermod -aG diseño,marketing,grupo_temporal root
id root 
# Prepare the practice scenario
mkdir -p ~/lab_chgrp/{proyectos,reportes,scripts}
touch ~/lab_chgrp/proyectos/app.py
touch ~/lab_chgrp/proyectos/config.json
touch ~/lab_chgrp/reportes/informe.txt
touch ~/lab_chgrp/scripts/deploy.sh
# View initial state — everyone has the user group
ls -la ~/lab_chgrp/proyectos/
ls -la ~/lab_chgrp/reportes/
# Change the group of a file
sudo chgrp desarrolladores ~/lab_chgrp/proyectos/app.py
ls -la ~/lab_chgrp/proyectos/
# Change the group of multiple files at once
sudo chgrp diseno ~/lab_chgrp/proyectos/config.json ~/lab_chgrp/reportes/informe.txt
# Verify changes in both directories
ls -la ~/lab_chgrp/proyectos/
ls -la ~/lab_chgrp/reportes/