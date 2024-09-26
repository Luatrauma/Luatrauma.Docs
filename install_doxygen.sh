#!/usr/bin/env bash

cd libs
mkdir doxygen
wget https://www.doxygen.nl/files/doxygen-1.12.0.linux.bin.tar.gz -O doxygen.tar.gz
tar -xvf doxygen.tar.gz -C doxygen --strip-components=1
cd ..