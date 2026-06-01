#!/bin/bash
# ------------------------------------------------------------------------------
# SECTION 4: BASH INTERPRETER DIAGNOSTICS & DEBUGGING
# ------------------------------------------------------------------------------

# bash -n blackhatbash2.sh: 
# Performs a 'syntax-check only' (dry-run). It parses the script to detect structural 
# errors (like missing 'done' in loops or 'fi' in conditionals) without actually 
# executing any commands. Critical for identifying bugs before production deployment.
bash -n blackhatbash2.sh

# bash -x blackhatbash2.sh: 
# Enables 'xtrace' mode. Displays every command to the terminal as it is executed, 
# preceded by a '+' sign, and expands variable values. This is the primary 
# instrumentation tool for deep forensic debugging and auditing script flow.
bash -x blackhatbash2.sh

# bash +x blackhatbash2.sh:
# Restores the default environment by disabling the 'xtrace' (debug) mode. 
# It effectively silences the verbose output. Essential for clean script termination 
# and preventing security-sensitive data (like expansion of passwords or keys) 
# from being leaked into standard output/logs.
bash +x blackhatbash2.sh