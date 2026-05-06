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
sudo groupadd developers
sudo groupadd -g 2000 operations  # Specific GID
# System group (GID < 1000)
sudo groupadd --system web_services