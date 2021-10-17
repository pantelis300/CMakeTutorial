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
--------------------------------------------------

The first feature we will add is to provide our executable and project with a
version number. While we could do this exclusively in the source code, using
``CMakeLists.txt`` provides more flexibility.

First, modify the ``CMakeLists.txt`` file to use the ``project()`` command
to set the project name and version number.

.. code-block::

  cmake_minimum_required(VERSION 3.15)

  # Set the project name and version
  project(Tutorial VERSION 1.0)


Then, configure a header file to pass the version to the source code:

.. code-block::

  configure_file(TutorialConfig.h.in TutorialConfig.h)

Since the configured file will be written into the binary tree, we must add the
directory to the list of paths to search for include files. Add the following
files to the end of the CMakeLists.txt file:

.. code-block::

  target_include_directories(Tutorial PUBLIC
                             "${PROJECT_BINARY_DIR}")


Using your favorite editor, create ``TutorialConfig.h.in`` in the source directory
with the following contents:

.. code-block::

  // the configuration options and settings for Tutorial
  #define Tutorial_VERSION_MAJOR @Tutorial_VERSION_MAJOR@
  #define Tutorial_VERSION_MINOR @Tutorial_VERSION_MINOR@


When CMake configures this header file the values for ``@Tutorial_VERSION_MAJOR@``
and ``Tutorial_VERSION_MINOR@`` will be replaced.

Next modify ``tutorial.cpp`` to include the configured header file, ``TutorialConfig.h``.

Finally, let's print out the executable name and version number by updating ``tutorial.cpp``
as follows:

.. code-block::

  if (argc < 2) {
    // report version
    std::cout << argv[0] << " Version " << Tutorial_VERSION_MAJOR
              << '.' << Tutorial_VERSION_MINOR << '\n';
    std::cout << "Usage: " << argv[0] << " number\n";
    return EXIT_FAILURE;
  }


Specify the C++ Standard
------------------------
Next let's add some C++11 features to our project by replacing ``atof`` with
``std::stdod`` in ``tutorial.cpp``. At the same time, remove
``#include <cstdlib>``.

.. code-block::

  const double inputValue = std::stod(argv[1]);


We will need to explicitly state in the CMake code that it should use the
correct flags. The easiest way to enable support for a specific C++ standard
in CMake is by using the ``CMAKE_CXX_STANDARD`` variable. For this tutorial, set the
``CMAKE_CXX_STANDARD`` variable in the ``CMakeLists.txt`` file to ``11`` and
``CMAKE_CXX_STANDARD_REQUIRED`` to ``True``. Make sure to add the ``CMAKE_CXX_STANDARD``
declarations above to call the ``add_executable``.


.. code-block::

  cmake_minimum_required(VERSION 3.10)

  # Set the project name and version
  project(Tutorial VERSION 1.0)

  # Specify the C++ standard
  set(CMAKE_CXX_STANDARD 11)
  set(CMAKE_CXX_STANDARD_REQUIRED True)


Rebuild
-------
