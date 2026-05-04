id #Displays the current user's UID (User ID), GID (Group ID), and groups.
cat /etc/passwd | head -10 # Reads the user account list and displays only the first 10 lines.
groups # Lists all the groups the current user belongs to.
groups $USER # Specifically queries and lists the groups for the username stored in the environment variable $USER
id -u #Prints the effective user ID (numeric UID) only.
id -g # Prints the effective group ID (numeric GID) only.
id -G
cat /etc/group |  grep root
cat /etc/gshadow
mkdir ~/proyecto_unix/
ls -la ~/proyecto_unix/