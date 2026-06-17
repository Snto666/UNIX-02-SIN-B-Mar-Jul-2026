#!/bin/bash

# ==============================================================================
# SCRIPT: grep_cheat_sheet.sh
# DESCRIPTION: Reference script for fundamental grep operations and filtering.
# References: Black Hat Bash Chapters 1 & 2
# ==============================================================================

# ------------------------------------------------------------------------------
# Block 1: Basic Matching and Logical Disjunction (OR)
# ------------------------------------------------------------------------------

# Uses grep's primary text-scanning engine to parse log.txt line by line, 
# emitting only the rows that match the literal target string exactly (grep, sed, awk — BHB Ch.2).
grep "35.237.4.214" log.txt

# Employs an escaped pipe character ('\|') to execute a logical OR match, 
# evaluating whether a line contains either the first or second pattern stream 
# within the regular expression scope (grep, sed, awk — BHB Ch.2).
grep "35.237.4.214\|13.66.139.0" log.txt


# ------------------------------------------------------------------------------
# Block 2: Pattern Chaining and Output Inversion
# ------------------------------------------------------------------------------

# Uses the '-e' flag to chain multiple discrete match constraints, offering 
# a cleaner, highly readable alternative for logical OR operations without 
# requiring manual escaping mechanisms (grep, sed, awk — BHB Ch.2).
grep -e "35.237.4.214" -e "13.66.139.0" log.txt

# Leverages the '-v' (invert-match) parameter to flip the selection criteria, 
# stripping out lines containing the specified pattern and passing only the 
# non-matching lines to standard output (grep, sed, awk — BHB Ch.2).
grep -v "35.237.4.214" log.txt


# ------------------------------------------------------------------------------
# Block 3: Token Extraction and Stream Pipeline Filtering
# ------------------------------------------------------------------------------

# Applies the '-o' (only-matching) switch to discard the surrounding line text, 
# isolating and outputting only the exact matching token sequence, which is ideal 
# for token counting architectures (grep, sed, awk — BHB Ch.2).
grep -o "35.237.4.214" log.txt

# Establishes a command pipeline (|) to route the process status output of 'ps' 
# into grep. The '-i' option ignores lower/uppercase variances, catching 'tty', 
# 'TTY', or 'Tty' streams alike (redirection and pipes — BHB Ch.1 | grep, sed, awk — BHB Ch.2).
ps | grep -i tty

# Executes a standard case-sensitive pattern search against the process list 
# stream, capturing exclusively the rows containing the uppercase literal token 'TTY' 
# (redirection and pipes — BHB Ch.1 | grep, sed, awk — BHB Ch.2).
ps | grep TTY


# ------------------------------------------------------------------------------
# Block 4: Structural Exclusion and Column Extraction Transitions
# ------------------------------------------------------------------------------

# Repeats the exclusion filter on the target log to clean the data line stream 
# prior to pipeline structural processing (grep, sed, awk — BHB Ch.2).
grep -v "35.237.4.214" log.txt

# Utilizes AWK to isolate and print only the first positional field ($1) of the log, 
# showing the transition from regex-based row filtering to structured data schema mining 
# (grep, sed, awk — BHB Ch.2).
awk '{print $1}' log.txt