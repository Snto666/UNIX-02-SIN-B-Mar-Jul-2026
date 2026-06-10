#!/bin/bash
# ------------------------------------------------------------------------------
# SECTION : SEQUENTIAL, CONDITIONAL, AND SUBSHELL EXECUTION
# ------------------------------------------------------------------------------

# touch test && touch test123:
# Utilizes the logical AND operator '&&'. The second command executes *only* if the 
# first command returns a successful exit status (0).
# Impacts script flow by establishing strict task dependencies and ensuring a clean environment.
touch test && touch test123

# (ls; ps):
# Executes commands sequentially inside a 'subshell' environment using parentheses '()'.
# Impacts process management: It forks a distinct child process space. Any environmental change 
# or variable assignment executed inside these boundaries completely vanishes upon closing 
# parenthesis, preserving parent shell state integrity.
(ls; ps)

# ls; ps; whoami:
# Employs sequential execution using semicolons ';'. Commands execute linearly one after 
# another, completely ignoring the success or failure (exit status) of preceding commands.
ls; ps; whoami

# lzl || echo "el comando lzl fallo ":
# Utilizes the logical OR operator '||'. The second command executes *only* if the first 
# command fails (returns a non-zero exit status).
# Impacts error-trapping architectures by deploying immediate fallback alerts or logs.
lzl || echo "el comando lzl fallo "

# ------------------------------------------------------------------------------
# SECTION : DATA STREAM REDIRECTION & FILE DESCRIPTOR ISOLATION
# ------------------------------------------------------------------------------

# echo "uno" > archivo.txt
# Employs standard output (STDOUT) redirection '>'. 
# CRITICAL: This is a destructive operation. It truncates (wipes) target asset contents 
# down to zero bytes before piping the new string into the file system.
echo "uno" > archivo.txt
cat archivo.txt

# Overwrite validation step: Demonstrating complete erasure of previous text contents.
echo "uno-uno" > archivo.txt
cat archivo.txt

# echo "uno-uno-dos" >> archivo.txt:
# Employs append redirection '>>'. It safely pushes the data string directly to the final line 
# of the targeted asset without destroying existing records. Impacts data retention logs.
echo "uno-uno-dos" >> archivo.txt
cat archivo.txt

# echo "tres" &> archivo.txt:
# Executes a combined stream redirection '&>'. Merges Standard Output (STDOUT / Descriptor 1) 
# and Standard Error (STDERR / Descriptor 2) into one stream, destructively overwriting the target.
echo "tres" &> archivo.txt
cat archivo.txt

# echo "tres" &>> archivo.txt:
# Executes a combined append redirection '&>>'. Concatenates both STDOUT and STDERR streams 
# onto the end of the asset, protecting operational history.
echo "tres" &>> archivo.txt
cat archivo.txt

# Real-world application capturing system-wide cataloging states and structural faults.
ls -l / &> stdout_and_stderr.txt

# WARNING: 'cat > filename' is highly interactive. It intercepts key strokes from STDIN 
# and halts automated background scripting engines until an explicit EOF (Ctrl+D) is captured.
# Bypassed and commented out to preserve automated script flow.
# cat > stdout_and_stderr.txt

# ls -l / 1> stdout.txt 2> stderr.txt:
# Explicit stream isolation mapping. Separates safe data payloads (1>) from structural faults (2>).
# Impacts forensic troubleshooting by routing standard execution to one repository while 
# capturing runtime engine breakdowns into an independent isolated file.
ls -l / 1> stdout.txt 2> stderr.txt

# lzl 2> error.txt:
# Target-specific redirection capturing exclusively Standard Error (STDERR / Descriptor 2).
# Ensures diagnostic stack traces or execution errors do not pollute standard operator views.
lzl 2> error.txt
cat error.txt

# cat < output.txt:
# Employs input redirection '<'. Replaces default keyboard input (STDIN / Descriptor 0) 
# with the textual payload stored inside the file asset, feeding it natively to the command.
cat < output.txt

# ------------------------------------------------------------------------------
# SECTION : INLINE STREAM INGESTION (HERE-DOCUMENTS)
# ------------------------------------------------------------------------------

# cat << EOF ... EOF:
# Initializes a 'Here-Document' structure '<<'. It allows multi-line text injection 
# directly into a command's STDIN stream without relying on external file assets.
# Impacts code maintainability positively by embedding static configuration blocks, 
# execution parameters, or visual application banners directly into the script structure.
cat << EOF
 Black Hat Bash
 by No Starch Press
EOF