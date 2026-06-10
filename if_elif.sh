#!/bin/bash 
# ------------------------------------------------------------------------------
# SECTION: POSITIONAL PARAMETER CAPTURE & INPUT VALIDATION
# ------------------------------------------------------------------------------

# USER_INPUT="${1}":
# Captures the first positional parameter ($1) passed via the CLI and maps it to a 
# descriptive environment variable. Using braced expansion '${1}' is a professional 
# best practice to cleanly segregate the parameter index from surrounding text strings.
USER_INPUT="${1}"

# if [[ -z "${USER_INPUT}" ]]; then ... fi:
# Utilizes the modern, extended test keyword '[[ ... ]]' combined with the '-z' operator.
# The '-z' string evaluator checks if the variable string length is exactly zero (null/empty).
# Impacts script robustness: Acts as a defensive gatekeeper, stopping execution early if 
# the operator fails to provide the mandatory input argument required for downstream tasks.
if [[ -z "${USER_INPUT}" ]]; then 
    echo "You must provide an argument!" 
    
    # exit 1:
    # Immediately terminates the shell execution context, returning a failure status code of 1 
    # to the parent process environment. Impacts automated orchestration pipelines by explicitly 
    # breaking the chain ('&&') and signaling to external tools that a user error occurred.
    exit 1 
fi

# ------------------------------------------------------------------------------
# SECTION: CONDITIONAL FILE SYSTEM EVALUATION (METADATA AUDITING)
# ------------------------------------------------------------------------------

# if [[ -f "${USER_INPUT}" ]]; then:
# Triggers a conditional binary file test using the '-f' operator inside the extended test syntax.
# Evaluates whether the string path points specifically to an existing *regular file* asset 
# (excluding directories, sockets, symlinks, or character devices).
if [[ -f "${USER_INPUT}" ]]; then 
    echo "${USER_INPUT} is a file." 

# elif [[ -d "${USER_INPUT}" ]]; then:
# Employs a sequential conditional alternative ('else if') using the '-d' operator.
# Evaluates whether the target path specifically maps to an existing *directory* node.
# Impacts forensic path routing by allowing the script to branch logic based on asset type.
elif [[ -d "${USER_INPUT}" ]]; then 
    echo "${USER_INPUT} is a directory." 

# else:
# Final unconditional fallback branch. Executes *only* if all preceding file system metadata 
# evaluations ('-f' and '-d') return a non-zero (false) exit status.
# Captures edge cases such as broken symlinks, block/character devices, or non-existent assets.
else 
    echo "${USER_INPUT} is not a file or a directory."
fi