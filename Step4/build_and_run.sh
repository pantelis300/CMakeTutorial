#!/bin/bash

rm -rf Step4_build
mkdir Step4_build && cd Step4_build

# Build and run with USE_MYMATH=ON
echo ""
echo "Changed USE_MYMATH option"
echo "Building with option USE_MYMATH=ON"
cmake .. -G Ninja -D USE_MYMATH=ON
cmake --build .
echo ""
echo ""
echo "Running Executable: ./Tutorial 81"
echo ""
./Tutorial 81

echo "Running cmake --install . --prefix='./Step4_install'"
mkdir ./Step4_install
cmake --install . --prefix="./Step4_install"
