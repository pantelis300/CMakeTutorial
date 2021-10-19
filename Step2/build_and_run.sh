#!/bin/bash

rm -rf Step2_build
mkdir Step2_build && cd Step2_build

# Build and run with USE_MYMATH=OFF
echo "Building with option USE_MYMATH=OFF"
cmake .. -G Ninja -D USE_MYMATH=OFF
cmake -LA
cmake --build .
echo ""
echo ""
echo "Running Executable: ./Tutorial 81"
echo ""
./Tutorial 81

# Build and run with USE_MYMATH=ON
echo ""
echo ""
echo "Changed USE_MYMATH option"
echo "Building with option USE_MYMATH=ON"
cmake .. -G Ninja -D USE_MYMATH=ON
cmake -LA
cmake --build .
echo ""
echo ""
echo "Running Executable: ./Tutorial 81"
echo ""
./Tutorial 81
