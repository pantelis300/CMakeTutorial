Step 1: A Basic Starting Point
==============================

The most basic project is an executable built from source code files.
For simple projects, a three line ``CMakeLists.txt`` file is all that is
required. This will be the starting point for our tutorial. Create a
``CMakeLists.txt`` file in the ``Step1`` directory that looks like:

.. code-block:: cmake
  :caption: CMakeLists.txt
  :name: CMakeLists.txt-start

  cmake_minimum_required(VERSION 3.15)

  # set the project name
  project(Tutorial)

  # add the executable
  add_executable(Tutorial tutorial.cpp)


Note that this example uses lower caase commands in the ``CMakeLists.txt`` file.
Upper, lower, and mixed case commands are supported by CMake. The source code for
``tutorial.cpp`` is provided in the ``Step1`` directory and can be used to compute
the square root of a number.

Build and Run
=============

That's all that is needed - we can build and run our project now! First, run the
``cmake`` executable or the ``cmake-gui`` to configure the project and then build
it with our chosen build tool.

For example, from the command line we could navigate to the ``Help/guide/tutorial`` directory
of the CMake source code and create a build directory:

.. code-block:: console

  mkdir Step1_build

Next, navigate to the build directory and run CMake to configure the project and generate
a native build system:

.. code-block:: console

  cd Step1_build
  cmake ..

Then call the build system to actually compile/link the project:

.. code-block:: console

  cmake --build .

Finally, try to use the newly built ``Tutorial`` with these commands:

.. code-block:: console

  $ ./Tutorial 81
  The square root of 81 is 9


Adding a Version Number and Configured Header File
==================================================
