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