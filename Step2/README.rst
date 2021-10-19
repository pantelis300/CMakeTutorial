Step 2: Adding a Library
========================
Now we will add a library to our project. This library will contain
our own implementation for computing the square root of a number.
The executable can then use this library instead of the square root
function provided by the compiler.

For this tutorial we will put the library into a subdirectory called
``MathFunctions``. This directory already contains a header file,
MathFunctions.h, and a source file sqrt.cpp. The source file has one
function called mysqrt that provides similar functionality to the
compiler's sqrt function.

Add the following one line CMakeLists.txt file to the MathFunctions
directory:

.. code-block::
  add_library(MathFunctions mysqrt.cpp)

To make use of the new library we will add an add_subdirectory() call
in the top-level CMakeLists.txt file so that the library will be built.
We add the new library to the executable, and add MathFunctions as an
include directory so that the ``mysqrt.h`` header file can be found.
The last few linew of the top-level ``CMakeLists.txt`` file should now
look like:

.. code-blocks::

  # Add the MathFunctions library
  add_subdirectory(MathFunctions) 

  # Add the executable
  add_executable(Tutorial tutorial.cpp)

  # Add the binary tree to search path for include files
  # so that we will find TutorialConfig.h
  target_include_directories(Tutorial PUBLIC
                             "{PROJECT_BINARY_DIR}"
                             "{PROJECT_SOURCE_DIR}/MathFunctions")

Now let us make the ``MathFunctions`` libary optional. While for the tutorial
there really isn't any need to do so, for larger projects this is a common
occurence. The first step is to add an option to the top-level ``CMakeLists.txt``
file.

.. code-blocks::

  option(USE_MYMATH "Use tutorial provided math implementation" ON)

  # condigure a header file to pass some of the CMake settings
  # to the source code
  configure_file(TurorialConfig.h.in TutorialConfig.h)


This option will be displayed in the cmake-gui and ccmake with a default
value of 'ON' that can be changed by the user. This setting will be stored
in the cache so that the user does not need to set the value each time they
run CMake on a build directory.

The next change is to make building and linking the MathFunctions library
conditional. To do this we change the end of the top-level CMakeLists.txt
to look like the following:

.. code-blocks::

  if (USE_MYMATH)
    add_subdirectory(MathFunctions)
    list(APPEND EXTRA_LIBS MathFunctions)
    list(APPEND EXTRA_INCLUDES "${PROJECT_SOURCE_DIR}/MathFunctions")
  endif()

  # Add the executable
  add_executable(Tutorial tutorial.cpp)

  target_link_libraries(Tutorial PUBLIC ${EXTRA_LIBS})

  # add the binary tree to the search path for include files
  # so that we will find TutorialCOnfig.h
  target_include_directories(Tutorial PUBLIC
                             "${PROJECT_BINARY_DIR}"
                             ${EXTRA_INCLUDES})

