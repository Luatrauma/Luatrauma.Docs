#!/usr/bin/env bash

mkdir -p build/api/cs/client
mkdir -p build/api/cs/server

cd api/cs/client
doxygen Doxyfile

cd ../server
doxygen Doxyfile