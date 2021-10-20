#!/bin/bash

rm -rf Step6_build
mkdir Step6_build && cd Step6_build

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

echo "Running cmake --install . --prefix='./Step6_install'"
mkdir ./Step6_install
cmake --install . --prefix="./Step6_install"

echo ""
echo ""
echo "Available ctests:"
ctest -N
echo ""
echo ""
ctest -VV
