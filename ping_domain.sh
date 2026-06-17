#!/bin/bash
# ==============================================================================
# SCRIPT: ping_domain.sh
# DESCRIPTION: Automated infrastructure auditing script that validates network 
#              reachability and logs structural execution payloads into CSV assets.
# References: Black Hat Bash Chapters 1 & 2
# ==============================================================================

# ------------------------------------------------------------------------------
# Block 1: Positional Parameter Validation Constraints
# ------------------------------------------------------------------------------

# Evaluates the '$#' special shell variable representing the total count of arguments passed.
# The binary conditional operator '-ne' flags if the count is not equal to exactly 2 
# (Flow control & text processing — BHB Ch.2 | the shell / commands — BHB Ch.1).
if [ "$#" -ne 2 ]; then
    # Routes a structured error descriptor diagnostic message directly to standard output 
    # to alert the operator of insufficient command parameters (the shell / commands — BHB Ch.1).
    echo "Error: Se requieren exactamente dos argumentos."
    
    # Outputs the precise syntax pattern schema layout using the '$0' expansion token, 
    # which dynamically references the execution name of the running script (the shell / commands — BHB Ch.1).
    echo "Uso: $0 <nombre> <dominio>"
    
    # Transmits a mock execution example to stdout, illustrating expected variable profiles 
    # like 'mysite' and 'nostarch.com' to guide the operator (the shell / commands — BHB Ch.1).
    echo "Example: $0 mysite nostarch.com"
    
    # Forces an immediate termination of the current shell context lifecycle, returning a 
    # non-zero exit status code (1) to indicate structural process failure to parent listeners 
    # (the shell / commands — BHB Ch.1).
    exit 1 
# Closes the logical parameter enforcement block, routing execution downward if requirements are met 
# (Flow control & text processing — BHB Ch.2).
fi

# ------------------------------------------------------------------------------
# Block 2: Environmental Scope and Variable Declarations
# ------------------------------------------------------------------------------

# Captures the first positional parameter '$1' from the execution stream and binds it 
# to the user-defined variable string identifier 'NAME' (the shell / commands — BHB Ch.1).
NAME=$1

# Extracts the second positional parameter '$2' containing the network domain target 
# and encapsulates it within the variable identifier 'DOMAIN' (the shell / commands — BHB Ch.1).
DOMAIN=$2

# Allocates an alphanumeric literal string asset defining the persistent structural 
# output target file as 'ping_results.csv' within the runtime path (the shell / commands — BHB Ch.1).
CSV_FILE="ping_results.csv"

# ------------------------------------------------------------------------------
# Block 3: Network Auditing and Binary Target Probing
# ------------------------------------------------------------------------------

# Invokes the 'ping' utility running a single icmp-packet count limit flag ('-c 1') 
# combined with a 2-second timeout deadline constraint ('-W 2') targeting the expanded domain. 
# It redirects standard output (stdout) to the standard null device storage sink ('> /dev/null') 
# and chains standard error (stderr) to that same stream destination descriptor ('2>&1') to mask 
# infrastructure logs from the active shell layout (redirection and pipes — BHB Ch.1 | Flow control — BHB Ch.2).
if ping -c 1 -W 2 "$DOMAIN" > /dev/null 2>&1; then
    # Binds a literal success state flag payload string to the environmental evaluation variable 
    # tracking pointer named 'RESULT' (the shell / commands — BHB Ch.1).
    RESULT="success"
    
    # Traces a network verification report confirmation string containing the expanded domain parameter 
    # targeting standard output (the shell / commands — BHB Ch.1).
    echo "El ping a $DOMAIN fue exitoso."
# Introduces the alternative fallback execution branch logic sequence if the icmp request returns a 
# non-zero error execution status code (Flow control & text processing — BHB Ch.2).
else
    # Maps an infrastructure failure descriptor token string onto the 'RESULT' state evaluation variable 
    # tracking container (the shell / commands — BHB Ch.1).
    RESULT="failure"
    
    # Routes an alert message indicating network communication failure with the targeted host string 
    # to standard output (the shell / commands — BHB Ch.1).
    echo "El ping a $DOMAIN falló."
# Seals the binary network auditing conditional evaluation branch structure safely 
# (Flow control & text processing — BHB Ch.2).
fi

# ------------------------------------------------------------------------------
# Block 4: Time Metric Resolution and Structural Data Logging
# ------------------------------------------------------------------------------

# Captures the kernel's real-time hardware clock metric using command substitution '$(...)', 
# passing specific formatting masks to compile a unified datetime string token inside 'TIMESTAMP' 
# (the shell / commands — BHB Ch.1).
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# Utilizes unary file-testing evaluation parameters ('! -f') inside a conditional statement block 
# to check if the target schema log asset does not exist as a standard file on disk 
# (Flow control & text processing — BHB Ch.2).
if [ ! -f "$CSV_FILE" ]; then
    # Employs the standard stream redirection operator (>) to serialize and print the initial structural 
    # schema comma-separated header row into the freshly opened CSV log file asset (redirection and pipes — BHB Ch.1).
    echo "Name,Domain,Result,Timestamp" > "$CSV_FILE"
# Concludes the defensive header initialization structural file block 
# (Flow control & text processing — BHB Ch.2).
fi

# Leverages the persistent append output redirection stream operator (>>) to write the compiled 
# comma-separated tracking records directly into the trailing line of the targets log file asset 
# on disk without clearing history data (redirection and pipes — BHB Ch.1).
echo "$NAME,$DOMAIN,$RESULT,$TIMESTAMP" >> "$CSV_FILE"