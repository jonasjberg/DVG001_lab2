#!/usr/bin/env bash

set -e

TEST_DIR="testdir"

C_NORMAL=$(tput sgr0)
C_RED=$(tput setaf 1)
C_GREEN=$(tput setaf 2)
C_YELLOW=$(tput setaf 3)
TAB='  '

function msg_info()
{
    printf "${C_GREEN}[INFO]${C_NORMAL}${TAB}"
    printf "%s ..\n" "$*"
}

function msg_warn()
{
    printf "${C_YELLOW}[WARNING]${C_NORMAL}${TAB}"
    printf "%s ..\n" "$*"
}

function msg_error()
{
    printf "${C_RED}[ERROR]${C_NORMAL}${TAB}"
    printf "%s ..\n" "$*"
}

msg_info "Starting test runner"
msg_info "Setting up test environment"

if [ -x "$TEST_DIR" ]
then
    msg_warn "Removing previous test environment"
    rm -rfv "$TEST_DIR"
fi

mkdir -v "$TEST_DIR"
cp -v inlupp.sh "$TEST_DIR"


msg_info "Starting test now"

# Anvand ett sub-shell for att isolera "cd"-kommandot.
(
    cd $TEST_DIR && ./inlupp.sh || msg_error "Failed to start"

    msg_info "Done running script .."
    msg_info "${Folder} contents:"
    tree

    for f in $(find . -type f -not -name "inlupp.sh")
    do
        msg_info "File: ${f}"
        msg_info "Contents:"
        cat "$f"
        echo ""
    done
)

msg_info "Done running test"

