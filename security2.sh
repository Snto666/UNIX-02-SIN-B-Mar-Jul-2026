#View current main group
id #Displays real and effective user and group IDs
id-gn # Only the name of the primary group # Displays only the primary group name
# Create a file and see which group it inherits 
touch ~/test_grupo_heredado.txt # Creates an empty file named 'test_grupo_heredado.txt' in the home directory
ls -la ~/test_grupo_heredado.txt #Lists the file details, including permissions, owner, and group
# The group is the user's primary group