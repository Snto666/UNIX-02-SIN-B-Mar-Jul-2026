sudo apt update  #It updates the app list and then automatically installs all available upgrades without asking you anything.
sudo apt upgrade # Download and install the latest versions of all system programs without requiring manual confirmation.
sudo apt install parted # It searches for the program in the repositories and installs the partitioning tool automatically.
sudo parted -l && echo -e "\n---\n" && lsblk -f && echo -e "\n---\n" # It first shows the status of the physical disk with its partitions and then details the format of each one to know exactly what each disk is[ -d /sys/firmware/efi ] && echo ""UEFI" || echo "BIOS" # 
[ -d /sys/firmware/efi ] && echo "UEFI" || echo "BIOS" #Check if there is a specific folder in the system to identify whether the computer boots in modern or old mode (BIOS or UEFI).
echo "esto es un archivo" > archivo.txt # Create a text file called "file.txt" and write that phrase inside it.