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