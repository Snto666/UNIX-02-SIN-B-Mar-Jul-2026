#View current main group
id # Displays real and effective user and group IDs
id -gn # Only the name of the primary group | Displays only the primary group name
# Create a file and see which group it inherits 
touch ~/test_grupo_heredado.txt # Creates an empty file named 'test_grupo_heredado.txt' in the home directory
ls -la ~/test_grupo_heredado.txt # Lists the file details, including permissions, owner, and group
# The group is the user's primary group

# View the current group
id -gn # Displays the name of the current primary group
echo "Grupo actual: $(id -gn)" # Prints the current group name to the screen
# Create a file before newgrp
touch ~/antes_de_newgrp.txt # Creates an empty file named 'antes_de_newgrp.txt' in the home directory
ls -la ~/antes_de_newgrp.txt # Lists the details of the created file to verify its group ownership

# Switch to developers group
sudo -E setpriv --reuid=vscode --regid=1001 --init-groups /bin/bash # Opens a new clean shell session forcing the 'desarrolladores' group ID
# Verify that the active group changed
id -gn # Displays the current active primary group name
echo "Nuevo grupo activo: $(id -gn)" # Prints the confirmation message with the current group name

# === STEP 1: Group and User Preparation ===
# Create the new group in Alpine Linux
sudo addgroup desarrolladores # Creates a new system group named 'desarrolladores'
# Add the current user to the group
sudo adduser vscode desarrolladores # Adds the 'vscode' user to the 'desarrolladores' group

# === STEP 2: System Utilities Installation ===
# Install the util-linux package in Alpine Linux
sudo apk add util-linux # Installs additional low-level system utilities for Linux including setpriv

# === STEP 3: Switch Group and Verification ===
# Switch to the desarrolladores group
sudo -E setpriv --reuid=vscode --regid=1001 --init-groups /bin/bash # Opens a new clean shell session forcing the 'desarrolladores' group ID
# Verify that the active group changed
id -gn # Displays the current active primary group name
echo "Nuevo grupo activo: $(id -gn)" # Prints the confirmation message with the current group name

# Create a file inside the subshell
touch ~/dentro_de_newgrp.txt # Creates an empty file named 'dentro_de_newgrp.txt' in the user's home directory
ls -la ~/dentro_de_newgrp.txt # Lists the file details to verify its ownership, permissions, and group assignment
# The group is now'desarrolladores'
# Create a directory
mkdir -p ~/proyecto_dev/src # Creates the 'proyecto_dev/src' directory structure, including any missing parent directories
ls -la ~/ # Lists the contents of the home directory to check the newly created file and folder structures

# project_dev/ belongs to 'desarrolladores' group
# Force environment rollback to the original primary group
sudo -E setpriv --reuid=vscode --regid=1000 --init-groups /bin/bash # Spawns a clean session forcing the original 'vscode' group ID (1000)
# Verify that we returned to the original group
id -gn # Displays the current active primary group name to confirm the rollback
echo "Grupo restaurado: $(id -gn)" # Prints the confirmation message with the restored group name

