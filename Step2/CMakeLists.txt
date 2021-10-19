cmake_minimum_required(VERSION 3.15)

# Set the project name
project(Tutorial VERSION 1.0)

# Specify the C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Configure a header file to pass some of the CMake settings
# to the source code
configure_file(TutorialConfig.h.in TutorialConfig.h)

# Add the MathFunction library
add_subdirectory(MathFunctions)

# Add the executable
add_executable(Tutorial tutorial.cpp)

target_link_libraries(Tutorial PUBLIC MathFunctions)

# Add the binary tree to the search path for include files
# so that we will find TutorialConfig.h
target_include_directories(Tutorial PUBLIC
                          "${PROJECT_BINARY_DIR}"
			  "${PROJECT_SOURCE_DIR}/MathFunctions")
