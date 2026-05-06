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
# Verify that they were created
grep "desarrolladores\|operaciones\|servicios _web" /etc/group
grep -E "desarrolladores|operaciones|servicios _web" /etc/group
# View main options
groupadd --help
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
sudo addgroup --gid 2100 marketing
sudo addgroup --system cache_web
#Verify
grep "diseno\|marketing\|cache_web" /etc/group