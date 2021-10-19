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

