#!/bin/bash

rm -rf Step5_build
mkdir Step5_build && cd Step5_build

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

echo "Running cmake --install . --prefix='./Step5_install'"
mkdir ./Step5_install
cmake --install . --prefix="./Step5_install"

echo ""
echo ""
echo "Available ctests:"
ctest -N
echo ""
echo ""
ctest -VV
