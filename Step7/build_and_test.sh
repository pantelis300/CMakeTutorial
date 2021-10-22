#!/bin/bash

rm -rf Step7_build
mkdir Step7_build && cd Step7_build

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

echo "Running cmake --install . --prefix='./Step7_install'"
mkdir ./Step7_install
cmake --install . --prefix="./Step7_install"

# Run Tests
echo ""
echo ""
ctest

# Build a binary distribution
cpack

# To specify the generator, use the ``-G`` option.
# cpack -G ZIP -C Debug

# Create a source distribution
cpack --config CPackSourceConfig.cmake
