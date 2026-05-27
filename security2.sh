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

# Install the util-linux package in Alpine Linux
sudo apk add util-linux # Installs additional low-level system utilities for Linux

# Switch to the desarrolladores group
sudo -E setpriv --reuid=vscode --regid=1001 --init-groups /bin/bash # Opens a new clean shell session forcing the 'desarrolladores' group ID
# Verify that the active group changed
id -gn # Displays the current active primary group name
echo "Nuevo grupo activo: $(id -gn)" # Prints the confirmation message with the current group name

# Create the new group in Alpine Linux
sudo addgroup desarrolladores # Creates a new system group named 'desarrolladores'
# Add the current user to the group
sudo adduser vscode desarrolladores # Adds the 'vscode' user to the 'desarrolladores' group
# Start a clean bash session preserving the environment using short flags
sudo -E setpriv --reuid=vscode --regid=1001 --init-groups /bin/bash # Spawns a bash shell with the new group ID while preserving the correct user HOME directory using the -E flag
# Verify that the active group changed
id -gn # Displays the current active primary group name
echo "Nuevo grupo activo: $(id -gn)" # Prints the confirmation message with the current group name
# Start a clean bash session forcing the desarrolladores group ID
sudo -E setpriv --reuid=vscode --regid=1001 --init-groups /bin/bash # Opens a new clean shell session forcing the 'desarrolladores' group ID
# Verify that the active group changed
id -gn # Displays the current active primary group name