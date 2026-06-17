#!/bin/bash
# ==============================================================================
# SCRIPT: string_comparison_logic.sh
# DESCRIPTION: Reference script for conditional evaluation and string matching.
# References: Black Hat Bash Chapters 1 & 2
# ==============================================================================

# ------------------------------------------------------------------------------
# Block 1: Variable Definition and Alphanumeric Assignment
# ------------------------------------------------------------------------------

# Declares and assigns literal alphanumeric values to discrete user-defined variables. 
# Proper formatting sets up the data layers before initiating any structural logic operations 
# (the shell / commands — BHB Ch.1).
VARIABLE_ONE="nostarch" 
VARIABLE_TWO="nostarch" 


# ------------------------------------------------------------------------------
# Block 2: Advanced Conditional Evaluation and Branching
# ------------------------------------------------------------------------------

# Employs the extended compound test construct '[[ ... ]]' to perform a string equality 
# check using the '==' operator. This advanced mechanism is highly recommended over 
# traditional single brackets ('[') because it prevents execution failures caused by unquoted 
# variables or empty strings during parameter expansion (Flow control & text processing — BHB Ch.2).
if [[ "${VARIABLE_ONE}" == "${VARIABLE_TWO}" ]]; then 
    # Routes a success tracing payload to standard output if the conditional constraint 
    # evaluates to a true state (zero exit status) (the shell / commands — BHB Ch.1).
    echo "They are equal!" 
else 
    # Executes an alternative fallback instruction vector if the evaluated expression 
    # resolves to a false state (non-zero exit status) (Flow control & text processing — BHB Ch.2).
    echo "They are not equal!" 
fi