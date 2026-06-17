#!/bin/bash
# ==============================================================================
# Script: Log Analysis and Text Manipulation Toolkit
# Description: Demonstrates advanced text parsing using awk, grep, and sed.
# References: Black Hat Bash Chapters 
# ==============================================================================

# ------------------------------------------------------------------------------
# Block 1: Structured Text Extraction with AWK
# ------------------------------------------------------------------------------

# Extracts and prints only the first whitespace-delimited field (typically the IP address 
# or timestamp in a standard log file) from log.txt (grep, sed, awk — BHB Ch.2).
awk '{print $1}' log.txt

# Extracts and outputs the first, second, and third fields separated by the default 
# output field separator (a space) to parse multi-column log data (grep, sed, awk — BHB Ch.2).
awk '{print $1,$2,$3}' log.txt

# Prints the first field and dynamically captures the last field on each line using 
# the built-in 'NF' (Number of Fields) variable, regardless of varying column lengths 
# per row (grep, sed, awk — BHB Ch.2).
awk '{print $1,$NF}' log.txt

# Modifies AWK's field separator parsing mechanism using the '-F' flag to parse comma-separated 
# values (CSV) instead of whitespace, printing the first column (grep, sed, awk — BHB Ch.2).
awk -F',' '{print $1}' example_csv.txt


# ------------------------------------------------------------------------------
# Block 2: Line Filtering and Pipeline Streams
# ------------------------------------------------------------------------------

# Uses AWK's built-in 'NR' (Number of Records) variable to act as a line filter, 
# evaluation conditional logic to print only lines 1 through 9 of log.txt (grep, sed, awk — BHB Ch.2).
awk 'NR < 10' log.txt

# Establishes a pipeline operator (|) to pass the standard output of grep (filtering lines 
# with a specific target IP) as the standard input for awk, which extracts the 7th field, 
# such as the requested HTTP path (redirection and pipes — BHB Ch.1 | grep, sed, awk — BHB Ch.2).
grep "42.236.10.117" log.txt | awk '{print $7}'


# ------------------------------------------------------------------------------
# Block 3: Stream Editing and File Redirection
# ------------------------------------------------------------------------------

# Employs sed (stream editor) to search for the pattern "Mozilla" and substitute it with "Godzilla". 
# The 'g' (global) modifier ensures all occurrences per line are replaced on stdout, 
# without altering the source file (grep, sed, awk — BHB Ch.2).
sed 's/Mozilla/Godzilla/g' log.txt

# Executes the same global text substitution via sed, but uses the standard output redirection 
# operator (>) to capture the stream and write the modified contents into a new persistent 
# file called newlog.txt (redirection and pipes — BHB Ch.1).
sed 's/Mozilla/Godzilla/g' log.txt > newlog.txt


# ------------------------------------------------------------------------------
# Block 4: Verification Commands (Comprobación del cambio)
# ------------------------------------------------------------------------------

# Verification Command 1: Confirming the presence of the new pattern.
# We search for the newly injected string "Godzilla" inside the newly generated file. 
# Piping into 'head' limits the output window so we can quickly eyeball the structural 
# accuracy of the modifications (redirection and pipes — BHB Ch.1 | grep, sed, awk — BHB Ch.2).
grep "Godzilla" newlog.txt | head -n 10

# Verification Command 2: Ensuring the total elimination of the old pattern.
# We use grep with the '-c' (count) flag to print the total number of times "Mozilla" 
# appears in the new file. If the global substitution succeeded perfectly, this command 
# must return exactly 0 (grep, sed, awk — BHB Ch.2).

# ------------------------------------------------------------------------------
# Block 5: Wholesale Whitespace Elimination and Content Display
# ------------------------------------------------------------------------------

# Uses sed to execute a global substitution that targets every literal space character 
# (' ') and replaces it with an empty string ('//'). The 'g' modifier ensures this 
# happens across the entire line, effectively compressing or stripping all spaces 
# before redirecting the stream into a new file (grep, sed, awk — BHB Ch.2 | redirection and pipes — BHB Ch.1).
sed 's/ //g' log.txt > newlog1.txt

# The 'cat' (concatenate) utility reads the newly generated, space-stripped file 
# and dumps its entire content stream directly into the terminal's standard output 
# for immediate visual inspection (the shell / commands — BHB Ch.1).
cat newlog1.txt