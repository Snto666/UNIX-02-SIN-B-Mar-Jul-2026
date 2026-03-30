sudo apt update  #It updates the app list and then automatically installs all available upgrades without asking you anything.
sudo apt upgrade # Download and install the latest versions of all system programs without requiring manual confirmation.
sudo apt install parted #It searches for the program in the repositories and installs the partitioning tool automatically.
sudo parted -l && echo -e "\n---\n" && lsblk -f && echo -e "\n---\n" #It first shows the status of the physical disk with its partitions and then details the format of each one to know exactly what each disk is.