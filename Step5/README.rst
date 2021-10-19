Step 4: Installing and Testing
==============================
Now we can start install rules and testing support to our project.

Install Rules
-------------
The install rules are fairly simple: for ``MathFunctions`` we want to
install the library and header file for the application we want to install
the executable and configured header.

.. code-blocks::

  install(TARGETS MathFunctions DESTINATION lib)
  install(FILES MathFunctions.h DESTINATION include)


And to the end of the top-level ``CMakeLists.txt`` we add:

.. code-blocks::

  install(TARGETS Tutorial DESTINATION bin)
  install(FILES "${PROJECT_BINARY_DIR}/TutorialConfig.h}"
          DESTINATION include)


This is all that is needed to create a basic local install of the tutorial.

Now run the cmake executable or the cmake-gui to configure the project and then
build it with your chosen build tool.

Then run the install step by using the ``install`` option of the ``cmake`` command
(introduced in 3.15, older version of CMake must use ``make install``) from the
command line. For multi-configuration tools, don't forget to use the ``--config``
argument to specify the configuration. If using an IDE, simple build the INSTALL
target. This step will install the appropriate header files, libraries, and
executables. For example:

.. code-blocks:: console

  cmake --install .


The CMake variable ``CMAKE_INSTALL_PREFIX`` is used to determine the root of where
the files will be installed. If using the ``cmake --install`` command, the installation
prefix can be overridden via the --prefix argument. For example:

.. code-blocks:: console

  cmake --install . --prefix "~/installdir"


Testing Support
---------------
Next let's test our application. At the end of the top-level ``CMakeLists.txt`` file
we can enable testing and then add a number of basic tests to verify that the application
is working correctly.

.. code-blocks::

  enable_testing()

  # Does the application run
  add_test(NAME Runs COMMAND Tutorial 25)

  # Does the usage message work?
  add_test(NAME Usage COMMAND Tutorial)
  set_tests_properties(Usage
    PROPERTIES PASS_REGULAR_EXPRESSION "Usage:.*number")

  # Define a function to simplify adding tests
  function(do_test target arg result)
    add_test(NAME Comp${arg} COMMAND ${target} ${arg})
    set_tests_properties(Comp${arg}
                        PROPERTIES PASS_REGULAR_EXPRESSION ${result})
  endfunction(do_test)

  # Do a bunch of result based tests
  do_test(Tutorial 4 "4 is 2")
  do_test(Tutorial 9 "9 is 3")
  

The first test simply verifies that the application runs, does not segfault or otherwise
crash, and has zero return value. This is the basic form of a CTest test.

The next test makes use of the PASS_REGULAR_EXPRESSION test property to verify that the
output of the test contains certain strings, verifying that the usage message is printed
when an incorrect number of arguments are provided.

Lastrly, we have a function called ``do_test`` that runs the application and verifies
that the computed square root is correct for a given input. For each invocation of do_test,
another test is added to the project with a name, input and expected results based on the
passed arguments.

Rebuild the application and then cd to the binary directory and run the ``ctest`` executable:
``ctest -N`` and ``ctest -VV``. For multi-config generators (e.g. Visual Studio), the
configuration type must be specified. To run tests in Debug mode, for example, use
``ctest -C Debug -VV`` from the build directory (not the Debug subdirectory!).
