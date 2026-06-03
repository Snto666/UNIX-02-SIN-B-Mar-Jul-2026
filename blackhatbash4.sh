#!/bin/bash
# ------------------------------------------------------------------------------
# SECTION 9: ARITHMETIC OPERATIONS & EVALUATION METHODS
# ------------------------------------------------------------------------------

# let result="4 * 5":
# Uses the 'let' shell built-in command to evaluate arithmetic expressions.
# Impacts script efficiency positively as it does not spawn a new process (subshell).
# The expression must be explicitly enclosed in quotes when it contains spaces.
let result="4 * 5"

# echo ${result}:
# Retrieves and prints the evaluated integer stored in the variable. 
# Uses braced expansion '${}' to guarantee variable boundary safety.
echo ${result}

# result=$((5 * 5)):
# Utilizes POSIX-compliant arithmetic expansion '$((...))' to perform math.
# Impacts performance significantly: This is the most modern and fastest method 
# in Bash because it evaluates natively in-memory without external binaries.
result=$((5 * 5))

# Retrieves the evaluated integer from the arithmetic expansion.
echo ${result}

# result=$(expr 5 + 505):
# Uses command substitution '$(...)' to capture the output of the external 'expr' binary.
# Impacts system overhead: Unlike built-ins, calling 'expr' forces the kernel to 
# fork a new process. This is legacy syntax and slows down execution in automated loops.
# Note: Strict spacing between integers and operators is required by the binary.
result=$(expr 5 + 505)

# Retrieves the evaluated integer from the external binary execution.
echo ${result}

# ------------------------------------------------------------------------------
# SECTION 10: SYSTEM DOCUMENTATION & UTILITY REFERENCE
# ------------------------------------------------------------------------------

# man expr:
# WARNING: 'man' opens an interactive visual pager that blocks script execution.
# Bypassed (commented out) for script runtime safety and automation integrity.
# Displays the manual page, impacting your knowledge of advanced 'expr' capabilities 
# (like substring matching or regex evaluation) beyond basic arithmetic.
# man expr