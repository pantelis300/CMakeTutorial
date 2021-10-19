#!/bin/bash

rm -rf Step2_build
mkdir Step2_build && cd Step2_build
cmake .. -G Ninja
cmake --build .
echo ""
echo "Running Executable: ./Tutorial 81"
echo ""
./Tutorial 81
