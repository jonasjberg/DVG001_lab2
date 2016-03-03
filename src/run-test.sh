#!/usr/bin/env bash

set -e

TEST_DIR="testdir"

C_NORMAL=$(tput sgr0)
C_RED=$(tput setaf 1)
C_GREEN=$(tput setaf 2)
C_YELLOW=$(tput setaf 3)

function msg_info()
{
    TAB='  '
    printf "${GREEN}[+]${NORMAL}${TAB}"
    printf "%s ..\n" "$*"
}

msg_info "Starting test runner"
msg_info "Setting up test environment"

if [ -x "$TEST_DIR" ]
then
    rm -rfv "$TEST_DIR"
fi

mkdir -v testdir
cp -v inlupp.sh testdir


echo "[+] Starting test now .."

# Anvand ett sub-shell for att isolera "cd"-kommandot.
(
    cd testdir
    ./inlupp.sh

    echo "_________________________________________________________________"
    echo "[+] Done running script .."
    echo "    folder contents:"
    tree

    for f in $(find . -type f -not -name "inlupp.sh")
    do
        echo "File: ${f}"
        echo "Contents:"
        cat "$f"
        echo ""
    done
)

echo "Done running test!"
echo "_________________________________________________________________"

