#!/bin/bash

# ------------------------------------------------------------------------------
# SECTION 8: ADVANCED VARIABLE SCOPE & SYNTAX COMPARISON
# ------------------------------------------------------------------------------

# GLOBAL VARIABLE: Declared at the script level. Accessible by all functions.
PUBLISHER="No Starch Press"

print_name(){
    # LOCAL VARIABLE: Defined with the 'local' keyword. Its scope is restricted 
    # to this function block. This prevents "Variable Shadowing", ensuring that 
    # global variables remain untouched by functional logic.
    local name
    name="Black Hat Bash"
    
    # BASH SYNTAX NOTE: In Bash, variables do not require parentheses for invocation.
    # Unlike languages such as Python or Java, where variables or method calls 
    # often utilize specific structural syntax or object-oriented access, Bash 
    # invokes variables directly via the '$' prefix. 
    # - Java/Python: require clear punctuation or object references (e.g., this.name).
    # - Bash: prioritizes direct shell expansion using the '$' sign to indicate 
    #   that the shell should replace the variable name with its stored value.
    
    echo "${name} by ${PUBLISHER}"
}

# CALLING THE FUNCTION: In Bash, functions are invoked by name without 
# parentheses. Adding '()' would cause a syntax error or a shell expansion issue.
print_name

# SCOPE VALIDATION: 
# The following confirms that 'name' exists only within 'print_name'.
# Attempting to access '${name}' globally results in an empty value, 
# demonstrating effective memory isolation.
echo "Variable ${name} will not be printed because it is a local variable."

# ------------------------------------------------------------------------------
# SUMMARY: BASH VS. OTHER LANGUAGES
# ------------------------------------------------------------------------------
# 1. Parentheses: Bash functions are called by name; no '()' needed for invocation.
# 2. Variable Access: Bash uses the '$' prefix for expansion. In Python/Java, 
#    variables are accessed by name directly within their scope.
# 3. Type System: Bash is loosely typed (strings by default), whereas 
#    Java is strongly typed (requires declaration of int, String, etc.).
# 4. Scope: Bash uses the 'local' keyword to enforce encapsulation, mirroring 
#    the private/public access modifiers found in high-level OOP languages.