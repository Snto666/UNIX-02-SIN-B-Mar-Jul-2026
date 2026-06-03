#!/bin/bash
# ------------------------------------------------------------------------------
# SECTION 5: VARIABLE EXPANSION & STRING MANIPULATION
# ------------------------------------------------------------------------------

# Variable assignment: 'book' is assigned the value "black hat bash". 
# This stores the string in the shell's memory for later retrieval.
book="black hat bash"

# echo "This book's name is ${book}":
# Uses 'braced variable expansion'. The braces '${}' explicitly define the 
# boundaries of the variable name. This is considered best practice in 
# professional scripting to avoid ambiguity (e.g., if you wanted to add 
# characters immediately after the variable name).
echo "This book's name is ${book}"

# echo "This book's name is $book":
# Uses 'simple variable expansion'. While functional, it relies on the shell 
# to infer the variable boundary. If followed by alphanumeric characters, 
# it can lead to logic errors where the shell fails to identify the variable. 
# Using '${}' (as shown above) is safer and more robust for maintainable code.
echo "This book's name is $book"

# ------------------------------------------------------------------------------
# SECTION 6: COMMAND SUBSTITUTION & DATA PIPELINING
# ------------------------------------------------------------------------------

# root_directory=$(ls -ld /):
# This uses 'command substitution' '$(...)'. It captures the standard output (STDOUT) 
# of the 'ls -ld /' command (which lists the root directory long-format properties) 
# and stores that entire string inside the variable 'root_directory'. 
# This technique allows us to manipulate system metadata programmatically.
root_directory=$(ls -ld /)

# echo "${root_directory}":
# Retrieves the stored string from the variable and prints it to the terminal.
# This validates that the system metadata was successfully captured and preserved 
# within the current session's memory, demonstrating efficient data pipelining.
echo "${root_directory}"

# ------------------------------------------------------------------------------
# SECTION 7: VARIABLE LIFECYCLE MANAGEMENT
# ------------------------------------------------------------------------------

# Unassigning Variables:
# Variables persist in the shell's memory until they are explicitly removed 
# or the session terminates. Using 'unset' effectively destroys the variable 
# definition, freeing memory and preventing potential logic errors or 
# accidental reuse of sensitive data in subsequent script execution phases.

book="Black Hat Bash"   # Assigning a value to the variable
unset book             # Removes the variable definition from the shell environment

# The following command will produce no output (or an empty line), confirming 
# that the variable 'book' no longer exists in the current scope.
echo "${book}"
