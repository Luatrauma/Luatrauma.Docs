#!/usr/bin/env bash

cd build
rm -rf html
mkdir html

cp -r manual/* html/

mkdir -p html/api/cs/client
mkdir -p html/api/cs/server
cp -r api/cs/client/html/* html/api/cs/client
cp -r api/cs/server/html/* html/api/cs/server
