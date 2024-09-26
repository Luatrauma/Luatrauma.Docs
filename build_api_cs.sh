#!/usr/bin/env bash

DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"

mkdir -p $DIR/build/api/cs/client
mkdir -p $DIR/build/api/cs/server

doxygen_binary="$DIR/libs/doxygen/bin/doxygen"

if ! command -v "$doxygen_binary" &>/dev/null; then
    echo "doxygen binary not found; falling back to system doxygen"
    doxygen_binary="doxygen"
fi

cd $DIR/api/cs/client
"$doxygen_binary" Doxyfile

cd $DIR/api/cs/server
"$doxygen_binary" Doxyfile