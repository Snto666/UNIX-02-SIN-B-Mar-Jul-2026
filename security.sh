id #Displays the current user's UID (User ID), GID (Group ID), and groups.
cat /etc/passwd | head -10 # Reads the user account list and displays only the first 10 lines.
groups # Lists all the groups the current user belongs to.
groups $USER # Specifically queries and lists the groups for the username stored in the environment variable $USER
id -u #Prints the effective user ID (numeric UID) only.
id -g # Prints the effective group ID (numeric GID) only.
id -G # Prints all group IDs (supplementary GIDs) associated with the user.
cat /etc/group |  grep root # Searches for the string "root" within the group definition file to show its GID and members.
cat /etc/gshadow # Displays the file containing encrypted group passwords and group administrators (usually requires root/sudo access).
mkdir ~/proyecto_unix/
ls -la ~/proyecto_unix/