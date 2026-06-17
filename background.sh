#!/bin/bash
# ==============================================================================
# SCRIPT: job_and_fs_operations.sh
# DESCRIPTION: Reference script for background process control and filesystem basic operations.
# References: Black Hat Bash Chapter 1
# ==============================================================================

# ------------------------------------------------------------------------------
# Block 1: Asynchronous Execution and Job Control
# ------------------------------------------------------------------------------

# Writes an informational message to standard output to indicate the onset of an 
# asynchronous operation (the shell / commands — BHB Ch.1).
echo "Sleeping for 10 seconds..."

# Invokes the 'sleep' command combined with the background control operator (&). 
# This instructs the shell to fork the process into an asynchronous background job, 
# immediately returning control to the terminal prompt to continue executing subsequent 
# instructions concurrently without blocking the stream (the shell / commands — BHB Ch.1).
sleep 10 &


# ------------------------------------------------------------------------------
# Block 2: Basic Filesystem Manipulation
# ------------------------------------------------------------------------------

# Informs the user of an impending filesystem structural modification (the shell / commands — BHB Ch.1).
echo "Creating the file test123"

# Uses the 'touch' utility to interact with the filesystem. If the file 'test123' 
# does not exist, it initializes a brand new, completely empty file allocation table entry; 
# if it does exist, it updates its access and modification timestamps (the shell / commands — BHB Ch.1).
touch test123

# Informs the user of an impending file deletion sequence (the shell / commands — BHB Ch.1).
echo "Deleting the file test123"

# Employs the 'rm' (remove) utility to unlink the target file 'test123' from the filesystem 
# hierarchy, effectively deleting it from disk (the shell / commands — BHB Ch.1).
rm test123