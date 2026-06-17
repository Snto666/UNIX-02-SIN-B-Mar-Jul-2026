#!/bin/bash

# ============================================================================
# Exercise 2: Pinging a Domain
# Description: Ping a domain and log results to CSV with timestamps
# Author: Santiago
# ============================================================================

set -euo pipefail  # Exit on error, undefined vars, pipe failures

# Configuration
readonly SCRIPT_NAME="$(basename "$0")"
readonly CSV_FILE="ping_results.csv"
readonly CSV_HEADER="Name,Target Domain,Ping Result,Date and Time"

# ============================================================================
# Functions
# ============================================================================

# Display usage information
usage() {
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
}

# Validate arguments
validate_args() {
    if [[ $# -lt 2 ]]; then
        echo "Error: Missing required arguments." >&2
        echo "" >&2
        usage >&2
        exit 1
    fi
}

# Validate domain format (basic validation)
validate_domain() {
    local domain="$1"
    
    # Check if domain contains at least one dot and valid characters
    if ! [[ "$domain" =~ ^[a-zA-Z0-9]([a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(\.[a-zA-Z0-9]([a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$ ]]; then
        echo "Error: Invalid domain format: '$domain'" >&2
        exit 2
    fi
}

# Initialize CSV file with headers if it doesn't exist
initialize_csv() {
    if [[ ! -f "$CSV_FILE" ]]; then
        echo "$CSV_HEADER" >> "$CSV_FILE"
        echo "✓ Created new CSV file: $CSV_FILE"
    fi
}

# Perform ping and return result
ping_domain() {
    local domain="$1"
    local timeout=5  # seconds
    
    # Attempt to ping with timeout; capture exit code without exiting script
    if ping -c 1 -W "$timeout" "$domain" &> /dev/null; then
        echo "SUCCESS"
        return 0
    else
        echo "FAILURE"
        return 1
    fi
}

# Write result to CSV
write_to_csv() {
    local name="$1"
    local domain="$2"
    local result="$3"
    local timestamp="$4"
    
    local csv_entry="$name,$domain,$result,$timestamp"
    
    if echo "$csv_entry" >> "$CSV_FILE"; then
        return 0
    else
        echo "Error: Failed to write to CSV file." >&2
        exit 3
    fi
}

# Get current date and time in ISO 8601 format
get_timestamp() {
    date '+%Y-%m-%d %H:%M:%S'
}

# Display results to user
display_results() {
    local name="$1"
    local domain="$2"
    local result="$3"
    local timestamp="$4"
    
    echo ""
    echo "============================================"
    echo "Ping Results"
    echo "============================================"
    echo "Name:              $name"
    echo "Target Domain:     $domain"
    echo "Result:            $result"
    echo "Timestamp:         $timestamp"
    echo "============================================"
    echo "✓ Results written to: $CSV_FILE"
    echo ""
}

# ============================================================================
# Main Script
# ============================================================================

main() {
    # Validate arguments
    validate_args "$@"
    
    local name="$1"
    local domain="$2"
    
    # Validate domain format
    validate_domain "$domain"
    
    # Initialize CSV
    initialize_csv
    
    # Perform ping
    echo "Pinging $domain..."
    local result
    result=$(ping_domain "$domain")
    
    # Get timestamp
    local timestamp
    timestamp=$(get_timestamp)
    
    # Write to CSV
    write_to_csv "$name" "$domain" "$result" "$timestamp"
    
    # Display results
    display_results "$name" "$domain" "$result" "$timestamp"
    
    # Exit with appropriate code
    if [[ "$result" == "SUCCESS" ]]; then
        exit 0
    else
        exit 0  # Still exit 0 because the script executed successfully; the domain just didn't respond
    fi
}

# Run main function with all arguments
main "$@"

#EJECUTAR PARA SU CORRECTA EJECUCION: "bash exercise_2_ping.sh localhost localhost"


