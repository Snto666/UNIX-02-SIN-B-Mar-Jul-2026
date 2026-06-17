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
# ------------------------------------------------------------------------------
# Block 6: Line-Specific Deletions via Stream Editing
# ------------------------------------------------------------------------------

# Utilizes sed's line-addressing capabilities to target specifically line number 1. 
# The 'd' (delete) command drops this initial line (often used to strip column headers 
# or old metadata) from the stream, saving the truncated result into newlog.txt 
# (grep, sed, awk — BHB Ch.2 | redirection and pipes — BHB Ch.1).
sed '1d' log.txt > newlog.txt
# Employs the special '$' address identifier in sed, which dynamically represents 
# the absolute last line of the input stream regardless of the file's length. 
# The 'd' command drops this trailing line, and the output is redirected into 
# newlogl.txt (grep, sed, awk — BHB Ch.2 | redirection and pipes — BHB Ch.1).
sed '$d' log.txt > newlogl.txt

# ------------------------------------------------------------------------------
# Block 7: Multi-Line Range Operations and In-Place Stream Editing
# ------------------------------------------------------------------------------

# Uses a comma-separated line range specification ('5,7') to target lines 5 through 7 
# inclusive. The 'd' command deletes this specific slice from the stream before the 
# standard output redirection operator (>) writes the remaining payload into a new 
# separate file named newlog57.txt (grep, sed, awk — BHB Ch.2 | redirection and pipes — BHB Ch.1).
sed '5,7d' newlog.txt > newlog57.txt

# The '-n' flag suppresses sed's default behavior of automatically printing every line of 
# the input stream. By combining it with the address range '2,15' and the explicit 'p' (print) 
# action, sed isolates and displays only lines 2 through 15 on standard output, acting 
# as a highly precise file slicer (grep, sed, awk — BHB Ch.2).
sed -n '2,15 p' log.txt

# Employs the highly destructive '-i' (in-place) option, which instructs sed to apply 
# modifications directly to the source file (log.txt) instead of routing the altered data 
# stream to standard output. Here, it permanently strips out line 1 (the first record) 
# from the asset on disk (grep, sed, awk — BHB Ch.2).
sed -i '1d' log.txt
# ------------------------------------------------------------------------------
# Block 8: Session Job Management and Process Table Auditing
# ------------------------------------------------------------------------------

# Spawns a long-running 'sleep' execution environment asynchronously using the 
# background control operator (&). Upon execution, the shell instantly prints a job 
# confirmation token mapping the localized job index [1] to the kernel's global 
# Process ID tracking number (PID 25708) (the shell / commands — BHB Ch.1).
sleep 100 &
# RESULT: [1] 25708

# Generates a full-format system-wide snapshot of all active operating system processes 
# ('ps -ef') and pipes that standard output stream into grep to isolate lines matching 
# the token 'sleep'. This exposes execution parameters across parent-child structures, 
# displaying UID, PID, Parent PID (PPID), and execution terminal channels (TTY) 
# (redirection and pipes — BHB Ch.1 | Setting up the lab — BHB Ch.3).
ps -ef | grep sleep
#"root           1       0  0 12:13 ?        00:00:00 /bin/sh -c echo Container started trap "exit 0" 15  exec "$@" while sleep 1 & wait $!; do :; done -
#root       25708     711  0 13:10 pts/2    00:00:00 sleep 100
#root       25737     711  0 13:10 pts/2    00:00:00 sleep 100
#root       25754     711  0 13:10 pts/2    00:00:00 sleep 100
#root       25760     711  0 13:10 pts/2    00:00:00 sleep 100
#root       25772     711  0 13:10 pts/2    00:00:00 sleep 100
#root       25914       1  0 13:10 ?        00:00:00 sleep 1
#root       25923     711  0 13:10 pts/2    00:00:00 grep --color=auto sleep"

# Queries the shell's internal session job table using the 'jobs' built-in command. 
# Unlike 'ps' (which monitors kernel-wide operations), 'jobs' strictly tracks asynchronous 
# tasks localized to the current shell environment. It displays job indexes, operational 
# states, and positional symbols like '+' (the primary/current background job target for 
# 'fg' or 'bg' shortcuts) and '-' (the secondary/previous background job) 
# (the shell / commands — BHB Ch.1).
jobs
#RESULT:
#[1]   Ejecutando                 sleep 100 &
#[2]   Ejecutando                 sleep 100 &
#[3]   Ejecutando                 sleep 100 &
#[4]-  Ejecutando                 sleep 100 &
#[5]+  Ejecutando                 sleep 100 &

# ------------------------------------------------------------------------------
# Block 8 (Continued): Foregrounding, Suspending, and Background Resumption Mechanics
# ------------------------------------------------------------------------------

# Pulls job number 1 ('%1') from the background session table into the foreground 
# of the terminal. This transfers operational control back to the standard input/output 
# streams, blocking the interactive shell prompt until the process terminates 
# or is intercepted (the shell / commands — BHB Ch.1).
fg %1
# RESULT: The terminal interface becomes blocked by the active process:
sleep 100

# Intercepts the active foreground process by issuing the 'Ctrl+Z' (^Z) keyboard sequence. 
# This transmits a SIGTSTP (terminal stop) kernel-level signal to the process stack, 
# halting its execution loop and changing its operational state from 'Running' to 
# 'Suspended/Stopped', thereby returning prompt control to the user (the shell / commands — BHB Ch.1).
^Z
# RESULT: The shell captures the suspension signal and prints the job state token:
# [1]+  Detenido                   sleep 100

# Invokes the 'bg' (background) built-in command to target the suspended job number 1 ('%1'). 
# This action transmits a SIGCONT (signal continue) to the process, forcing it to resume 
# execution asynchronously inside a background layer without hijacking the current terminal's 
# standard input stream (the shell / commands — BHB Ch.1).
bg %1 
# RESULT: The shell confirms background reactivation and appends the asynchronous control operator (&):
# [1]+ sleep 100 &
# ------------------------------------------------------------------------------
# Block 8 (Continued): Persistent Asynchronous Execution via nohup
# ------------------------------------------------------------------------------

# Executes the local script './exercise2.sh' using 'nohup' (No Hang Up) combined with the 
# background control operator (&). This architectural command detaches the process from the 
# current terminal session's lifecycle. If the terminal emulator closes or the SSH connection 
# drops, the process intercepts and ignores the resulting SIGHUP (Signal Hang Up) kernel notification, 
# ensuring persistent asynchronous execution (the shell / commands — BHB Ch.1 | Setting up the lab — BHB Ch.3).
nohup ./exercise2.sh &
# RESULT:
# [2] 34764
# nohup: se descarta la entrada y se añade la salida a 'nohup.out'
# NOTE: Because the process loses its interactive terminal binding, nohup automatically discards 
# standard input (stdin) and redirects standard output (stdout) along with standard error (stderr) 
# streams into a persistent file named 'nohup.out' within the working directory (redirection and pipes — BHB Ch.1).


# ------------------------------------------------------------------------------
# Verification Command: Auditing the Active Background Process State
# ------------------------------------------------------------------------------

# Generates a full system process status matrix ('ps -ef') and pipes the data stream into grep 
# to explicitly verify that './exercise2.sh' under PID 34764 is actively allocated inside the 
# operating system kernel's task scheduler (redirection and pipes — BHB Ch.1 | Setting up the lab — BHB Ch.3).
ps -ef | grep exercise2.sh
#[Santiago Yambay] UNIX-02-SIN-B-Mar-Jul-2026 ➜ $ nohup: se descarta la entrada y se añade la salida a 'nohup.out'