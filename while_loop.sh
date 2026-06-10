#!/bin/bash 
# ------------------------------------------------------------------------------
# SECTION: ASYNCHRONOUS PROCESS CONTROL & CONDITIONAL LOOPS
# ------------------------------------------------------------------------------

# SIGNAL_TO_STOP_FILE="stoploop":
# Defines a local environment variable storing the string literal "stoploop".
# This acts as a 'lockfile' or signaling mechanism, allowing basic inter-process 
# communication (IPC) by tracking the physical existence of a token file.
SIGNAL_TO_STOP_FILE="stoploop" 

# while [[ ! -f "${SIGNAL_TO_STOP_FILE}" ]]; do:
# Initializes a conditional 'while' loop using extended test evaluation '[[ ... ]]'.
# Combines the logical NOT operator '!' with the regular file test operator '-f'.
# Impacts process flow: Creates a blocking polling engine that continues iterating 
# indefinitely as long as the targeted lockfile does *not* exist in the working directory.
while [[ ! -f "${SIGNAL_TO_STOP_FILE}" ]]; do 
    
    # echo "The file ${SIGNAL_TO_STOP_FILE} does not yet exis t...":
    # Outputs a structural tracing message to Standard Output (STDOUT) on each loop iteration.
    # Uses safe braced variable expansion '${}' to prevent parsing bugs during execution.
    echo "The file ${SIGNAL_TO_STOP_FILE} does not yet exis t..." 
    
    # echo "Checking again in 2 seconds...":
    # Outputs a real-time cadence indicator to Standard Output (STDOUT).
    # Informs the operator of the precise monitoring frequency used by the polling mechanism.
    echo "Checking again in 2 seconds..." 
    
    # sleep 2:
    # Invokes the system time utility to suspend execution for an explicit duration of 2 seconds.
    # CRITICAL Performance Optimization: Throttles execution to prevent a "busy-wait" scenario. 
    # Without this structural delay, the CPU would cycle at 100% load continuously checking 
    # the file system, drastically degrading overall system efficiency.
    sleep 2 

# done:
# Marks the structural boundary and closing point of the 'while' loop body.
# Automatically redirects the execution sequence back to the evaluation header for verification.
done 

# echo "File was found! Exiting...":
# Prints the final resolution message to Standard Output (STDOUT).
# Executes exclusively *after* the loop terminates, validating that an external process 
# successfully provisioned the lockfile asset, allowing the script to exit cleanly.
echo "File was found! Exiting..."