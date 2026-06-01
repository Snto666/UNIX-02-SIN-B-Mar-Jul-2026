#!/bin/bash
# ==============================================================================
# Linux Command Auditing & Security Script (Advanced Documentation)
# Author: Santiago Yambay | Branch: blackhatbash
# Description: Detailed audit of system environment, file management, and 
# safety procedures following Black Hat Bash methodologies.
# ==============================================================================

# ------------------------------------------------------------------------------
# SECTION 1: SYSTEM ENVIRONMENT DIAGNOSTICS
# ------------------------------------------------------------------------------

# Enables 'xtrace' to display every command before execution. Essential for auditing.
set -x 

# bash --version: Outputs the version of the interpreter. Impacts compatibility for script syntax.
bash --version

# env: Lists all exported environment variables. Impacts process configuration and path resolution.
env

# Variables tracking session identity, affecting shell-specific logic.
echo "Shell: ${SHELL}"    # Identifies current interpreter
echo "Random: ${RANDOM}"  # Generates a pseudo-random integer (0-32767)
echo "UID: ${UID}"        # Displays User ID. Impacts permission levels (0 = root)
echo "OSTYPE: ${OSTYPE}"  # Identifies kernel/OS environment for portability

# ps -ef: Displays all processes with full formatting. Crucial for resource monitoring and PID/PPID mapping.
ps -ef

# df --human-readable: Reports disk space in GB/MB. Critical for preventing storage overflow/crashes.
df --human-readable

set +x # Safety: Disable debug mode to prevent unnecessary console flooding.

# ------------------------------------------------------------------------------
# SECTION 2: FILE SYSTEM NAVIGATION & AUDITING (LS COMMANDS)
# ------------------------------------------------------------------------------

# man ls: Displays the manual page. Impacts your knowledge of command switches/capabilities.
man ls > ls_manual_log.txt  # Redirects manual to file to maintain automation

# ls --help: Displays concise usage. Impacts rapid troubleshooting of command syntax.
ls --help

# ls -l: Long format. Lists permissions (rwx), ownership, and timestamps.
ls -l

# ls -la: Long format including hidden files (starting with '.'). Essential for config files (.bashrc).
ls -la

# ls --all: Identifies every entry including '.' and '..' (current and parent directories).
ls --all

# ls --group-directories-first: Organizes list by placing folders at the top. Improves readability.
ls --group-directories-first

# ls -R: Recursive listing. Impacts performance by scanning the entire directory tree.
ls -R

# ------------------------------------------------------------------------------
# SECTION 3: SAFETY & RECURSION MANAGEMENT
# ------------------------------------------------------------------------------

# SAFETY NOTE: The commands below are commented out. Executing scripts recursively 
# (calling a script inside itself) creates a 'fork bomb' cycle that consumes 
# all system memory and CPU cycles, eventually crashing the operating system.

# bash -n: Performs syntax check without execution. Impacts stability by detecting errors early.
# bash -n blackhatbash1.sh

# chmod +x: Modifies the file system metadata to grant execute permissions. 
# Affects security by allowing binary or script activation.
# chmod +x blackhatbash1.sh

# Execution command: Triggers the script file. 
# ./blackhatbash1.sh

echo -e "\e[32m[+] Execution Complete. System state documented and preserved.\e[0m"