#!/bin/bash
# ==============================================================================
# CISCO Linux Course (Part 2) 
# Author: Santiago Yambay
# Branch: linux_cisco_2
# Repository: Codeberg
# ==============================================================================

# Terminal Customization: Display Author identity in purple
echo -e "\e[35m[+] Executing System Administration Script by Santiago Yambay...\e[0m"

# 12) Mover archivos (Relocation and Renaming)
cd ~/Documents # Establish working directory context
mv people.csv Work # Relocate data asset to the Work directory
# Batch relocation: Move multiple text files into the School directory
mv numbers.txt letters.txt alpha.txt School
ls School # Verify successful batch migration
# Asset renaming: Use the move command to rename a file within the same directory
mv animals.txt zoo.txt
ls zoo.txt # Confirm renaming operation

# 13) Eliminar archivos (Destructive Operations)
# CRITICAL: 'rm' operations bypass the trash bin and are permanent.
rm linux.txt # Destroy single file permanently
# Verify file destruction (Expected to return 'No such file')
ls linux.txt 2>/dev/null 
# Recursive destruction: Remove a directory and all its underlying contents
rm -r Work

# 14) Filtrado de entradas (Regex and Data Mining)
cd ~/Documents
# Isolate the system administrator account details from the local passwd database
grep sysadmin passwd
# Anchor search (^): Locate all accounts where the line strictly begins with 'root'
grep '^root' /etc/passwd
# Anchor search ($): Locate all entries in alpha-first.txt ending specifically with 'r'
grep 'r$' alpha-first.txt
# Wildcard single character (.): Find lines with 'r', exactly two characters, then 'f'
grep 'r..f' red.txt
grep 'r..d' red.txt
# Identify lines containing at least any 4 consecutive characters
grep '....' red.txt

# 14.2) Patrones básicos (Character Classes and Quantifiers)
# Bracket expansion: Extract lines containing any numerical digit [0-9]
grep '[0-9]' profile.txt
# Negation inside brackets [^]: Extract lines containing non-numerical characters
grep '[^0-9]' profile.txt
# Literal character matching: Escape the wildcard meaning to find actual periods
grep '[.]' profile.txt
# Asterisk quantifier (*): Match zero or more occurrences of the preceding character
grep 're*d' red.txt
# Combined class and quantifier: Match 'r', followed by any number of 'o' or 'e', ending in 'd'
grep 'r[oe]*d' red.txt
# Require at least one 'e' to filter out zero-occurrence matches
grep 'ee*' red.txt

# 15) Apagar (System Halt and Maintenance Scheduling)
# WARNING: Interactive commands and system halts are commented out to prevent script termination
# su - # Switch to root user environment (Interactive)
# shutdown now # Trigger immediate kernel halt and system shutdown
# shutdown 01:51 # Schedule system halt for a specific timestamp
# shutdown +1 "Goodbye World!" # Broadcast maintenance warning and schedule halt in 1 min

# 16) Configuración de redes (Interface and Connectivity Auditing)
# Audit all active network interfaces, IP allocations, and MAC addresses
ifconfig
# ICMP Echo Request: Verify network connectivity to gateway (Limit to 4 packets to prevent infinite loop)
ping -c 4 192.168.1.2
# ICMP Failure Test: Validate packet loss when pinging an unreachable node
ping -c 4 192.168.1.3

# 17) Visualización de procesos (Process and Resource Monitoring)
# Display processes actively running under the current terminal session
ps
# System-wide process audit: Enumerate every process running across all users and spaces
ps -e
# Detailed system-wide audit: Include full command-line arguments and parent process IDs (PPID)
ps -ef

# 18) Administración de paquetes (Software Provisioning)
# Synchronize local package index with remote Debian/Ubuntu repositories
sudo apt-get update
# Query the local package cache for specific software descriptions (keyword: cow)
apt-cache search cow
# Unattended deployment: Install 'cowsay' bypassing interactive Y/N prompts (-y)
sudo apt-get install -y cowsay
# Execute the newly provisioned binary
cowsay 'NDG Linux Unhatched'
# System upgrade: Apply security patches and updates to all installed packages (-y for automation)
sudo apt-get upgrade -y
# Deep system cleanup: Remove software and entirely purge its configuration files (-y)
sudo apt-get purge -y cowsay

# 19) Actualización de contraseñas de usuario (Authentication Management)
# WARNING: Password modification is highly interactive and breaks automation. Commented for safety.
# passwd # Update current user's authentication token
# Query the password status, expiration, and lock state for the sysadmin account
passwd -S sysadmin
# su root # Elevate privileges to modify other users
# passwd sysadmin # Force update another user's token as root

# 20) Redirección (I/O Stream Management)
cd ~/Documents
# Standard Output (STDOUT) redirection: Overwrite or create newfile1.txt with contents of food.txt
cat food.txt > newfile1.txt
cat newfile1.txt # Verify file creation and content
# Print string to STDOUT
echo "Hello"
# Destructive redirection (>): Overwrite existing file contents with new string
echo "I like food." > newfile1.txt
cat newfile1.txt # Verify original content was destroyed and replaced
# Append redirection (>>): Safely add new line to the end of the file without data loss
echo "This food is good." >> newfile1.txt
cat newfile1.txt # Verify concatenation

# 21) Editor de texto (VI/VIM Environment)
# WARNING: VI is a visual, interactive editor that blocks script execution.
# Below is the documentation of learned workflows, bypassed for script runtime:
# vi newfile.txt # Open file in visual editor
# [Esc] # Return to Command Mode
# h, j, k, l # Cursor navigation (Left, Down, Up, Right)
# dd # Delete/Cut current line into buffer
# yy # Yank/Copy current line into buffer
# p / P # Put/Paste buffer contents after or before cursor
# /pattern # Search forward for regex pattern
# i, a, o # Enter Insert Mode (Before cursor, after cursor, new line)
# :w # Write changes to disk (Ex mode)
# :q! # Force quit without saving (Ex mode)

echo -e "\e[32m[+] Execution Complete. System state documented and preserved.\e[0m"