#!/bin/bash

# ============================================================================
# Exercise 2: Pinging a Domain
# Description: Ping a domain and log results to CSV with timestamps
# Author: Santiago
# References: Black Hat Bash Chapters 1, 2 & 3
# ============================================================================

# Enforces strict defensive execution patterns: '-e' terminates instantly if any command fails, 
# '-u' flags unassigned or empty environmental variables as terminal syntax errors, and 
# 'pipefail' prevents hidden backend pipeline errors from returning misleading success statuses 
# (the shell / commands — BHB Ch.1 | Flow control & text processing — BHB Ch.2).
set -euo pipefail  

# ----------------------------------------------------------------------------
# Configuration
# ----------------------------------------------------------------------------

# Strips directory paths out of the '$0' runtime parameter using basename execution wrapping, 
# locking down the script's absolute filename context inside an unmodifiable read-only memory register 
# (the shell / commands — BHB Ch.1).
readonly SCRIPT_NAME="$(basename "$0")"

# Allocates a persistent read-only literal string defining the operational tracking schema target 
# file asset as 'ping_results.csv' within the immediate working directory context (the shell / commands — BHB Ch.1).
readonly CSV_FILE="ping_results.csv"

# Establishes a read-only static text header schema line to isolate structural column parameters 
# inside generated infrastructure spreadsheets (the shell / commands — BHB Ch.1).
readonly CSV_HEADER="Name,Target Domain,Ping Result,Date and Time"

# ============================================================================
# Functions
# ============================================================================

# Declares a modular, reusable subroutine named 'usage' to output documentation syntax schemas 
# to terminal standard descriptors (the shell / commands — BHB Ch.1).
usage() {
    # Implements a standardized multi-line 'Here Document' block (cat << EOF), streaming textual help schemas 
    # directly into standard output interfaces without requiring redundant echo wrappers (redirection and pipes — BHB Ch.1).
    cat << EOF
Usage: $SCRIPT_NAME <name> <target_domain>

Arguments:
    <name>             A descriptive name for this ping (e.g., mysite)
    <target_domain>    The domain to ping (e.g., nostarch.com)

Examples:
    $SCRIPT_NAME mysite nostarch.com
    $SCRIPT_NAME myserver google.com

Exit Codes:
    0  - Successful execution
    1  - Missing arguments
    2  - Invalid domain format
    3  - CSV write error

EOF
# Concludes the Here-Doc literal text block and safely returns execution control back to the routine block 
# (redirection and pipes — BHB Ch.1).
}

# Initializes a custom verification function to enforce input safety rules on positional stream arrays 
# (Flow control & text processing — BHB Ch.2).
validate_args() {
    # Employs extended compound test operators '[[ ... ]]' to verify if the multi-parameter array count '$#' 
    # evaluates to a value numerically less than ('-lt') the operational requirement of 2 arguments (Flow control — BHB Ch.2).
    if [[ $# -lt 2 ]]; then
        # Routes a diagnostic fatal error notice to standard error descriptor '>&2' to prevent layout pollution 
        # (redirection and pipes — BHB Ch.1).
        echo "Error: Missing required arguments." >&2
        
        # Injects an empty layout spacing token line directly into standard error to isolate terminal debugging 
        # text (redirection and pipes — BHB Ch.1).
        echo "" >&2
        
        # Triggers the 'usage' function subroutine, forwarding its documentation text directly to standard error '>&2' 
        # (redirection and pipes — BHB Ch.1).
        usage >&2
        
        # Terminates the shell execution lifecycle instantly, returning code 1 to indicate argument validation failure 
        # (the shell / commands — BHB Ch.1).
        exit 1
    # Concludes the defensive argument validation block structure (Flow control & text processing — BHB Ch.2).
    fi
# Declares the functional boundary of the validate_args validation block routine.
}

# Defines an isolated network validation routine targeting user-supplied domain alphanumeric records.
validate_domain() {
    # Declares a localized variable parameter named 'domain', capturing parameter '$1' while protecting 
    # the parent script scope from unintended leaks (the shell / commands — BHB Ch.1).
    local domain="$1"
    
    # Executes regular expression compliance checking using the regex operator '=~' inside compound test conditions 
    # to evaluate domain integrity rules against a standard RFC text specification mask (Flow control — BHB Ch.2).
    if ! [[ "$domain" =~ ^[a-zA-Z0-9]([a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(\.[a-zA-Z0-9]([a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$ ]]; then
        # Directs a descriptive validation failure warning containing the rejected domain token to stderr 
        # (redirection and pipes — BHB Ch.1).
        echo "Error: Invalid domain format: '$domain'" >&2
        
        # Aborts execution, passing exit code 2 to notify external monitoring software of domain format validation failures 
        # (the shell / commands — BHB Ch.1).
        exit 2
    # Seals the defensive pattern matching conditional filter structure securely (Flow control — BHB Ch.2).
    fi
# Marks the terminal boundary of the validate_domain subroutine.
}

# Defines an infrastructure automation function to defensively initialize files on persistent media.
initialize_csv() {
    # Evaluates whether the declared spreadsheet tracker asset does not exist on disk using a unary file test flag '! -f' 
    # (Flow control & text processing — BHB Ch.2).
    if [[ ! -f "$CSV_FILE" ]]; then
        # Appends the required static read-only header formatting string to the top row of the newly allocated file asset 
        # (redirection and pipes — BHB Ch.1).
        echo "$CSV_HEADER" >> "$CSV_FILE"
        
        # Logs an operational tracking message to stdout indicating successful asset structure preparation 
        # (the shell / commands — BHB Ch.1).
        echo "✓ Created new CSV file: $CSV_FILE"
    # Safely closes the file existence defensive routine (Flow control & text processing — BHB Ch.2).
    fi
# Marks the termination point of the initialize_csv routine.
}

# Establishes a functional sub-routine to manage ICMP low-level network validation tasks.
ping_domain() {
    # Scopes an isolated internal parameter string capturing the incoming host destination address token 
    # (the shell / commands — BHB Ch.1).
    local domain="$1"
    
    # Allocates a localized numerical parameter configuring an absolute network connection timeout deadline 
    # (the shell / commands — BHB Ch.1).
    local timeout=5  
    
    # Dispatches an ICMP packet request ('-c 1') paired with the localized timeout constraint ('-W'). 
    # It redirects all output streams to the system null bucket descriptor ('&> /dev/null') to silence tracing logs 
    # (redirection and pipes — BHB Ch.1 | Flow control — BHB Ch.2).
    if ping -c 1 -W "$timeout" "$domain" &> /dev/null; then
        # Emits a standardized affirmative tracking keyword to standard output upon receiving an active response 
        # (the shell / commands — BHB Ch.1).
        echo "SUCCESS"
        
        # Returns code 0 to the main runtime architecture to indicate successful connectivity 
        # (the shell / commands — BHB Ch.1).
        return 0
    # Branches the conditional block to handle execution errors or dead routing pathways 
    # (Flow control & text processing — BHB Ch.2).
    else
        # Sends a negative tracking descriptor text to stdout indicating network timeout or down state 
        # (the shell / commands — BHB Ch.1).
        echo "FAILURE"
        
        # Passes a non-zero functional failure status return code (1) back to the calling process 
        # (the shell / commands — BHB Ch.1).
        return 1
    # Shuts down the interactive validation network conditional structure safely (Flow control — BHB Ch.2).
    fi
# Marks the close of the ping_domain logic architecture.
}

# Declares a data logging function to commit internal runtime metrics onto persistent disk architecture.
write_to_csv() {
    # Isolates the operational name metadata string to the local function stack memory workspace 
    # (the shell / commands — BHB Ch.1).
    local name="$1"
    
    # Binds the parsed destination network domain address onto a local scope text parameter 
    # (the shell / commands — BHB Ch.1).
    local domain="$2"
    
    # Secures the evaluated network operational descriptor (SUCCESS/FAILURE) into local routine memory 
    # (the shell / commands — BHB Ch.1).
    local result="$3"
    
    # Extracts the structured ISO chronological metrics token and maps it to a localized variable 
    # (the shell / commands — BHB Ch.1).
    local timestamp="$4"
    
    # Compiles the collected discrete runtime data strings into a single unified comma-delimited row entry 
    # (the shell / commands — BHB Ch.1).
    local csv_entry="$name,$domain,$result,$timestamp"
    
    # Pipes the unified data entry row to the persistent file on disk using the append redirection operator '>>' 
    # while running error tracking evaluations (redirection and pipes — BHB Ch.1 | Flow control — BHB Ch.2).
    if echo "$csv_entry" >> "$CSV_FILE"; then
        # Exits the sub-routine returning a zero status flag confirming successful persistent media serialization 
        # (the shell / commands — BHB Ch.1).
        return 0
    # Activates the alternative execution pathway if I/O blockades or permission failures interrupt storage 
    # (Flow control & text processing — BHB Ch.2).
    else
        # Forwards a critical storage access error notification to the standard error console channel 
        # (redirection and pipes — BHB Ch.1).
        echo "Error: Failed to write to CSV file." >&2
        
        # Kills execution with exit code 3 to signal file system write anomalies to host orchestrators 
        # (the shell / commands — BHB Ch.1).
        exit 3
    # Seals the data logging infrastructure error-handling code block (Flow control & text processing — BHB Ch.2).
    fi
# Finishes the write_to_csv structural function boundary.
}

# Declares a data-gathering subroutine to fetch synchronized operating system timer fields.
get_timestamp() {
    # Triggers the kernel date utility, executing format mapping switches to compile structured timestamp strings 
    # (the shell / commands — BHB Ch.1).
    date '+%Y-%m-%d %H:%M:%S'
# Ends the get_timestamp automation function block.
}

# Designs an administrative console layout sub-routine to stream real-time results to terminal viewers.
display_results() {
    # Locally captures the administrative profile token name from positional parameter array data slot 1 
    # (the shell / commands — BHB Ch.1).
    local name="$1"
    
    # Establishes an isolated routine context register holding the analyzed host target network domain 
    # (the shell / commands — BHB Ch.1).
    local domain="$2"
    
    # Loads the isolated network verification result text string into the function space 
    # (the shell / commands — BHB Ch.1).
    local result="$3"
    
    # Captures the formatted system time string to output it inside the console terminal report layout 
    # (the shell / commands — BHB Ch.1).
    local timestamp="$4"
    
    # Outputs an empty spacer line sequence to standard output to separate previous log text 
    # (the shell / commands — BHB Ch.1).
    echo ""
    
    # Generates a visual separation boundary line to structure the report block on stdout 
    # (the shell / commands — BHB Ch.1).
    echo "============================================"
    
    # Streams the report header identifier row to stdout to inform the active console observer 
    # (the shell / commands — BHB Ch.1).
    echo "Ping Results"
    
    # Re-prints the visual formatting alignment border matrix line down the terminal interface 
    # (the shell / commands — BHB Ch.1).
    echo "============================================"
    
    # Performs variable string expansion to print the administrative profile identity row to stdout 
    # (the shell / commands — BHB Ch.1).
    echo "Name:              $name"
    
    # Prints out the network target host destination string onto the active report sheet layout 
    # (the shell / commands — BHB Ch.1).
    echo "Target Domain:     $domain"
    
    # Displays the final evaluated network reachability state token inside the dashboard matrix 
    # (the shell / commands — BHB Ch.1).
    echo "Result:            $result"
    
    # Embeds the collected chronological time metric parameter row directly into standard output 
    # (the shell / commands — BHB Ch.1).
    echo "Timestamp:         $timestamp"
    
    # Closes the graphical reporting window outline on the user console screen layout 
    # (the shell / commands — BHB Ch.1).
    echo "============================================"
    
    # Outputs an assurance notice confirming successful string logging into the storage system 
    # (the shell / commands — BHB Ch.1).
    echo "✓ Results written to: $CSV_FILE"
    
    # Places a trailing padding spacing line on stdout to clean terminal data transitions 
    # (the shell / commands — BHB Ch.1).
    echo ""
# Marks the terminal line of the console reporting sub-routine framework.
}

# ============================================================================
# Main Script
# ============================================================================

# Establishes the master orchestration runtime entry point block for the execution environment.
main() {
    # Passes all input parameter array arrays ('$@') down to the argument enforcement checker logic 
    # (the shell / commands — BHB Ch.1).
    validate_args "$@"
    
    # Stores the validated first positional argument mapping context into the local variable scope parameter 'name' 
    # (the shell / commands — BHB Ch.1).
    local name="$1"
    
    # Allocates the verified domain target address value onto the local main block text variable 'domain' 
    # (the shell / commands — BHB Ch.1).
    local domain="$2"
    
    # Forwards the domain string variable to the regular expression scanner to verify format criteria rules 
    # (the shell / commands — BHB Ch.1).
    validate_domain "$domain"
    
    # Triggers the file initialization sub-routine to confirm database files and headers are active on disk 
    # (the shell / commands — BHB Ch.1).
    initialize_csv
    
    # Dispatches an asynchronous tracking status update notification text string to standard output 
    # (the shell / commands — BHB Ch.1).
    echo "Pinging $domain..."
    
    # Declares a local variable tracking pointer 'result' to trap functional evaluation returns 
    # (the shell / commands — BHB Ch.1).
    local result
    
    # Executes the network probing block inside a command substitution block '$(...)', storing the output token 
    # (the shell / commands — BHB Ch.1).
    result=$(ping_domain "$domain")
    
    # Declares a local string object 'timestamp' to manage datetime metrics within the main execution layer 
    # (the shell / commands — BHB Ch.1).
    local timestamp
    
    # Triggers the system clock capture routine, storing the formatted time output into the local main block 
    # (the shell / commands — BHB Ch.1).
    timestamp=$(get_timestamp)
    
    # Invokes the data writer function, passing profile, target, state, and clock variables to be committed to disk 
    # (the shell / commands — BHB Ch.1).
    write_to_csv "$name" "$domain" "$result" "$timestamp"
    
    # Triggers the user console reporting utility to render the execution results summary on stdout 
    # (the shell / commands — BHB Ch.1).
    display_results "$name" "$domain" "$result" "$timestamp"
    
    # Enforces conditional check constraints to map out appropriate program terminal exit pathways 
    # (Flow control & text processing — BHB Ch.2).
    if [[ "$result" == "SUCCESS" ]]; then
        # Exits gracefully with code 0 to confirm perfect network communication loops 
        # (the shell / commands — BHB Ch.1).
        exit 0
    # Triggers an alternate logic sequence when network nodes return negative verification results 
    # (Flow control & text processing — BHB Ch.2).
    else
        # Returns code 0 because the automation code completed its checking tasks successfully on the server architecture 
        # (the shell / commands — BHB Ch.1).
        exit 0  
    # Terminate the program completion logic block safely (Flow control & text processing — BHB Ch.2).
    fi
# Ends the main orchestration module block structure.
}

# Invokes the master main function loop, supplying the entire positional argument array layer passed to the script 
# (the shell / commands — BHB Ch.1).
main "$@"
