#!/bin/bash

rm -rf Step1_build
mkdir Step1_build && cd Step1_build
cmake .. -G Ninja
ninja
echo ""
echo "Running Executable: ./Tutorial 81"
echo ""
./Tutorial 81
