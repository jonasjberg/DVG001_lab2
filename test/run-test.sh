#!/usr/bin/env bash

#set -e

TEST_DIR="run_test"
SRC_DIR="../src"

C_NORMAL=$(tput sgr0)
C_RED=$(tput setaf 1)
C_GREEN=$(tput setaf 2)
C_YELLOW=$(tput setaf 3)
C_BLUE=$(tput setaf 4)
HALFTAB='  '
FULLTAB='    '

# FUNCTION MSG_TYPE() -- Prints timestamped debug messages
# Messages can be of three different types (severity): ERROR, INFO and WARNING.
# Usage: msg_type info example informative text
#        msg_type warn some unexpected thing happened 
#        msg_type "just text, no type specified"
function msg_type()
{
    if [ $# -gt 1 ]
    then
        local type="$1"
        shift
    fi
        
    local text="$*"

    case "$type" in
        error ) color=$C_RED    
                label="ERROR"   ;;
        info  ) color=$C_GREEN
                label="INFO"    ;;
        warn  ) color=$C_YELLOW 
                label="WARNING" ;;
        *     ) color=$C_NORMAL 
                label=""        ;;
    esac

    # Surround label with brackets if not empty.
    if [ ! -z "$label" ] 
    then
        label="${color}[${label}]${C_NORMAL}"
    fi

    TIMESTAMP="$(date +%H:%M:%S)"

    printf "${C_BLUE}[${TIMESTAMP}]${C_NORMAL} ${label}"
    printf "${FULLTAB}%s\n" "$text"

    #time box text
}



msg_type info "Starting test runner"
msg_type info "Setting up test environment"

if [ -x "$TEST_DIR" ]
then
    msg_type warn "Removing previous test environment"
    rm -rfv "$TEST_DIR"
fi

mkdir -v "$TEST_DIR"
cp -v "${SRC_DIR}/inlupp.sh" "$TEST_DIR"


msg_type info "Starting test now"

# Anvand ett sub-shell for att isolera "cd"-kommandot.
(
    cd $TEST_DIR && ./inlupp.sh || msg_type error "Failed to start"

    msg_type info "Done running script .."
    msg_type info "Contents of "$(pwd)":"
    tree

    for f in $(find . -type f -not -name "inlupp.sh")
    do
        msg_type info "File: ${f}"
        msg_type info "Contents:"
        cat "$f"
        echo ""
    done

    msg_type info "Running \"skalpgm.sh\""
)


msg_type info "Done running test"

