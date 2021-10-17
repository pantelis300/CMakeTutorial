#!/bin/bash

rm -rf Step1_build
mkdir Step1_build && cd Step1_build
cmake .. -G Ninja
cmake --build .
echo ""
echo "Running Executable: ./Tutorial 81"
echo ""
./Tutorial 81
