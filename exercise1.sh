#!/bin/bash
# ==============================================================================
# SCRIPT: identity_logger.sh
# DESCRIPTION: Reference utility designed to capture user identity parameters, 
#              serialize system chronological tracking data, and perform atomic 
#              filesystem asset duplications.
# References: Black Hat Bash Chapters 1 & 2
# ==============================================================================

# ------------------------------------------------------------------------------
# Block 10: Parameter Ingestion and Empty String Validation Constraints
# ------------------------------------------------------------------------------

# Captures the first positional command-line argument parameter passed into the script context ('${1}') 
# and maps it onto the local tracking configuration variable named 'PRIMER_NOMBRE' (the shell / commands — BHB Ch.1).
PRIMER_NOMBRE="${1}"

# Extracts the second positional execution argument token submitted by the user ('${2}') 
# and encapsulates it inside the structural variable named 'APELLIDO' (the shell / commands — BHB Ch.1).
APELLIDO="${2}"

# Initiates a conditional testing structure utilizing unary string evaluation parameters ('-z') 
# alongside the logical OR operator ('||') to check if either parsed argument expands to an empty string 
# (Flow control & text processing — BHB Ch.2).
if [ -z "${PRIMER_NOMBRE}" ] || [ -z "${APELLIDO}" ]; then
    # Routes a descriptive validation failure warning directly to standard output to alert the operator 
    # of missing execution arguments (the shell / commands — BHB Ch.1).
    echo "Error: Debes proporcionar tu nombre y apellido."
    
    # Outputs the explicit syntax layout schema documentation to stdout, guiding the user on the required parameter order 
    # (the shell / commands — BHB Ch.1).
    echo "Uso: ./exercise1.sh TuNombre TuApellido"
    
    # Aborts program execution instantly, returning a non-zero exit status code (1) to notify parent listening processes 
    # of an operational flow failure (the shell / commands — BHB Ch.1).
    exit 1
# Seals the defensive parameter enforcement block, allowing the execution stream to proceed downward if strings are populated 
# (Flow control & text processing — BHB Ch.2).
fi


# ------------------------------------------------------------------------------
# Block 10 (Continued): Stream Serialization and Filesystem Storage Operations
# ------------------------------------------------------------------------------

# Invokes the kernel date utility with custom formatting tokens ("%d-%m-%Y") and uses the standard file 
# truncation redirection operator (>) to serialize the calendar metrics into a new file asset named 'output.txt' 
# (redirection and pipes — BHB Ch.1).
date +"%d-%m-%Y" > output.txt

# Expands the user identity strings and utilizes the persistent append output redirection operator (>>) 
# to log the compiled text block into the trailing line of 'output.txt' without clearing existing records 
# (redirection and pipes — BHB Ch.1).
echo "${PRIMER_NOMBRE} ${APELLIDO}" >> output.txt

# Executes a low-level filesystem duplication operation using 'cp', cloning the structural content schema of 
# 'output.txt' into a separate persistent asset named 'backup.txt' inside the working path (the shell / commands — BHB Ch.1).
cp output.txt backup.txt

# Prints out a text separation delimiter row to standard output to structurally format the reporting dashboard console 
# (the shell / commands — BHB Ch.1).
echo "--- Contenido de output.txt ---"

# Invokes the 'cat' utility to open a stream connection with 'output.txt' on disk, dumping its raw logged text lines 
# directly into the active standard output console channel (the shell / commands — BHB Ch.1 | redirection and pipes — BHB Ch.1).
cat output.txt

# Generates the trailing horizontal visual alignment row on stdout to close the debugging transaction layout 
# (the shell / commands — BHB Ch.1).
echo "--------------------------------"