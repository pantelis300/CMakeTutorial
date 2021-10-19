Step 3: Adding Usage Requirements for a Library
===============================================

Usage requirements allow for far better control over a library or
executable's link and include line while also give more control over
the transitive property of targets inside CMake. The primary commands
that leverage usage requirements are:

  - target_compile_definitions()
  - target_compile_options()
  - target_compile_directories()
  - target_link_libraries()

Let's refactor our code from ``Step2: Adding a Library`` to use the modern
CMake approach of useage requirements. We first state that anybody linking
to ``MathFunctions`` needs to include the current source directory, while
``MathFunctions`` itself doesn't. So this can become an ``INTERFACE`` usage
requirement.

Remember ``INTERFACE`` means things that consumer require but the producer
doesn't. Add the following lines to the end of ``MathFunctions/CMakeLists.txt``:

.. code-block::

  target_include_directories(MathFunctions
                             INTERFACE ${CMAKE_CURRENT_SOURCE_DIR})


Now that we've specified usage requirements for ``MathFunctions`` we can
safely remove our uses of the ``EXTRA_INCLUDES`` variable from the top-level
``CMakeLists.txt``, here:

.. code-blocks::

  if (USE_MYMATH)
    add_subdirectory(MathFunctions)
    list(APPEND EXTRA_LIBS MathFunctions)
  endif()

And here:

.. code-blocks::

  target_include_directories(Tutorial PUBLIC
                             "${PROJECT_BINARY_DIR}")


Once this is done, run the cmake executable or the cmake-gui to
configure the project and then build it with your chosen build tool
or by using ``cmake --build .`` from the build directory.
