#!/bin/bash

# ==============================================================================
# SCRIPT: grep_cheat_sheet.sh
# DESCRIPTION: Reference script for fundamental grep operations and filtering.
# ==============================================================================

# 1. BASIC SEARCH: Extract lines containing the literal string
grep "35.237.4.214" log.txt

# 2. LOGICAL OR (Escaped Pipe): Search for Pattern A OR Pattern B
grep "35.237.4.214\|13.66.139.0" log.txt

# 3. MULTIPLE PATTERNS (-e): A cleaner alternative for logical OR operations
grep -e "35.237.4.214" -e "13.66.139.0" log.txt

# 4. INVERT MATCH (-v): Exclude lines matching the pattern from the output
grep -v "35.237.4.214" log.txt

# 5. EXACT MATCH ONLY (-o): Isolate and print only the matching string token
grep -o "35.237.4.214" log.txt

# 6. CASE-INSENSITIVE PIPE (-i): Filter system data ignoring lower/uppercase differences
ps | grep -i tty

ps | grep TTY

grep -v "35.237.4.214" log.txt
