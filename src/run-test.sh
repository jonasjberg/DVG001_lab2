#!/usr/bin/env bash

set -e

TEST_DIR="testdir"


if [ -x "$TEST_DIR" ]
then
    rm -rfv "$TEST_DIR"
fi
    
mkdir -v testdir
cp -v inlupp.sh testdir

echo "Setting up test environment .."
# Anvand ett sub-shell for att isolera "cd"-kommandot.
(
    cd testdir
    ./inlupp.sh
    tree

    for f in $(find . -type f)
    do
        echo "File contents:"
        echo "    ${f}"
        cat "$f"
        echo ""
    done
)

echo "Done running test"

