#!/bin/bash

# ------------------------------------------------------------------------------
# SECTION 11: BASH ARRAY MANAGEMENT & INDEXING
# ------------------------------------------------------------------------------

# IP_ADDRESSES=(192.168.1.1 192.168.1.2 192.168.1.3):
# Defines a compound assignment to initialize a one-dimensional indexed array.
# Elements are space-separated inside parentheses and stored in the shell's memory.
# Impacts automation positively by allowing batch processing of multiple data 
# assets (like network targets) within a single variable structure.
IP_ADDRESSES=(192.168.1.1 192.168.1.2 192.168.1.3)

# echo "${IP_ADDRESSES[*]}":
# Uses the '*' wildcard index to expand all elements of the array into a single 
# string, separated by the first character of the IFS (Internal Field Separator).
# Impacts data pipelining when you need to quickly output or log the entire 
# collection of assets simultaneously.
echo "${IP_ADDRESSES[*]}"

# echo "${IP_ADDRESSES[0]}":
# Explicitly references a specific element using zero-based indexing ([0] = first element).
# CRITICAL syntax rule: Braced variable expansion '${}' is strictly mandatory here. 
# Without the braces, the interpreter would only expand '$IP_ADDRESSES' (the first element) 
# and treat '[0]' as literal text outputted to the terminal, causing a logic bug.
echo "${IP_ADDRESSES[0]}"

# ------------------------------------------------------------------------------
# SECTION 12: ARRAY ELEMENT DELETION & VALUE MUTATION
# ------------------------------------------------------------------------------

# unset IP_ADDRESSES[1]:
# Selectively destroys the array element at index 1 (the second network asset).
# CRITICAL: This creates a "sparse array". Bash does not collapse or shift the 
# subsequent elements down to fill the gap; Index 0 and Index 2 persist exactly 
# where they are, leaving Index 1 unassigned. Impacts loop iteration logic, 
# meaning scripts must account for non-contiguous indices to prevent null errors.
unset IP_ADDRESSES[1]

# echo "${IP_ADDRESSES[*]}":
# Expands and outputs the remaining valid assets to the terminal.
# Note that while the printed output visually collapses the space, the underlying 
# array mapping remains structurally sparse.
echo "${IP_ADDRESSES[*]}"

# IP_ADDRESSES[0]="192.168.1.10":
# Directly mutates the data asset at index 0 by overwriting its value in memory.
# Impacts dynamic automation by allowing real-time modification of target variables, 
# system paths, or configuration states without needing to rebuild the entire array.
IP_ADDRESSES[0]="192.168.1.10"

# Final state validation: Prints all elements to confirm successful mutation of index 0.
echo "${IP_ADDRESSES[*]}"
