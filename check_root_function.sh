#!/bin/bash 
# This function checks if the current user ID equals zero. 
# check_if_root(){ ... }:
# Declares a user-defined shell function. Encapsulates a reusable block of logic 
# within the current shell execution environment. 
# Impacts maintainability positively by preventing code duplication across large-scale 
# administration and deployment automation toolkits.
check_if_root(){ 
    
    # if [[ "${EUID}" -eq "0" ]]; then:
    # Leverages the built-in read-only shell variable '${EUID}' (Effective User ID).
    # Uses the '-eq' operator inside extended test brackets for strict integer comparison.
    # CRITICAL Security Rule: While '${UID}' represents the real logged-in user, '${EUID}' 
    # reflects current operational access rights, accurately capturing elevated state shifts 
    # triggered by 'sudo' or SUID binaries (0 always dictates absolute root/kernel authority).
    if [[ "${EUID}" -eq "0" ]]; then 
        
        # return 0:
        # Passes an explicit success status code back to the local function caller scope.
        # Impacts script lifecycle: Unlike 'exit', 'return' halts execution inside the 
        # function block only, safely passing control back to the main script without 
        # destroying the parent shell process environment.
        return 0 
    else 
        
        # return 1:
        # Passes a generic execution failure status code back to the caller environment.
        return 1 
    fi 
} 

# if check_if_root; then:
# Directly invokes the user-defined function as a conditional evaluation expression.
# The 'if' control structure natively intercepts the function's exit status ($?); 
# an exit status of 0 routes the execution flow directly to the primary true branch.
if check_if_root; then 
    
    # echo "User is root!":
    # Outputs a verification string to Standard Output (STDOUT).
    # Confirms that the runtime engine is operating under absolute system administration privileges.
    echo "User is root!" 

# else:
# Unconditional alternative branch execution point.
# Triggers strictly if the evaluation expression (the function call) returns any non-zero exit code.
else 
    
    # echo "User is not root!":
    # Outputs an operational status indicator to Standard Output (STDOUT).
    # Identifies that the script is executing within a restricted, non-privileged user space.
    echo "User is not root!" 

# fi:
# Closes the conditional execution block.
# Properly terminates the branching structure and restores standard sequential script flow.
fi

# ------------------------------------------------------------------------------
# SECTION: USER PROVISIONING & IDENTITY SWITCHING
# ------------------------------------------------------------------------------

# useradd userito:
# Invokes the low-level system utility to provision a brand-new user account named 'userito'.
# Impacts system databases: Directly injects new cryptographic and identity metadata records 
# into critical system configuration files, specifically '/etc/passwd' and '/etc/shadow'.
# This registers a valid unprivileged local identity within the current OS architecture.
useradd userito

# su userito:
# Executes the 'substitute user' binary to transition the active session into the 'userito' scope.
# Note: By omitting the login shell dash ('-'), this command performs a non-login context shift, 
# meaning it inherits the current working directory and parts of the previous shell's environment.
# Impacts privilege evaluation: Successfully switches the Effective User ID ('${EUID}'), allowing 
# the operator to run and audit execution flows under a safe, unprivileged test account.
su userito