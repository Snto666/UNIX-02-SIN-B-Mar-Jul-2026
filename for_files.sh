#!/bin/bash

# ==============================================================================
# SCRIPT: continue_loop_documented.sh
# DESCRIPTION: Iterates through files matching a pattern and writes random data.
#              Demonstrates conditional flow control using the 'continue' keyword.
# ==============================================================================

# 1. LOOP INITIATION & FILENAME EXPANSION (GLOBBING)
# The expression 'example_file*' expands to a list of all matching files in the 
# current directory. In each iteration, the filename is assigned to the variable '$file'.
for file in example_file*; do

    # 2. CONDITIONAL EVALUATION
    # Uses Bash extended test [[ ... ]] to perform a string comparison.
    # Checks if the current file being processed is exactly "example_file1".
    if [[ "${file}" == "example_file1" ]]; then
    
        # 3. STANDARD OUTPUT ANNOUNCEMENT
        # Prints a real-time diagnostic message to the terminal screen (stdout).
        echo "Skipping the first file: ${file}"
        
        # 4. CONTROL FLOW INTERRUPTION
        # Instantly halts the execution of the CURRENT iteration.
        # The interpreter skips lines 26 and 27, jumping straight to the next file.
        continue 
        
    fi # 5. END OF CONDITIONAL BLOCK

    # 6. PSEUDO-RANDOM GENERATION & DESTRUCTIVE I/O REDIRECTION
    # This line runs ONLY for files that did NOT trigger the 'continue' command.
    # '${RANDOM}' generates an integer between 0 and 32767.
    # The '>' operator truncates (clears) the file and writes the new number into it.
    echo "${RANDOM}" > "${file}"

done # 7. END OF LOOP