Step5: Adding System Introspection
==================================
Let us consider adding some code to our project that depends on features
the target platform may not have. For this example, we will add some code
that depends on whether or not the target platform has the ``log`` and ``exp``
functions. Of course almost every platform has these functions but for this
tutorial assume that they are not common.

If the platform has ``log`` and ``exp`` then we will use them to compute the
square root in the ``mysqrt`` function. We first test for the availability
of these functions using the CheckSymbolExists module in
``MathFunctions/CMakeLists.txt``. On some platforms, we will need to link to
the ``m`` library. If ``log`` and ``exp`` are not initially found, require
the ``m`` library and try again.

.. code-block::

  include(CheckSymbolExists)
  check_symbol_exists(log "math.h" HAVE_LOG)
  check_symbol_exists(exp "math.h" HAVE_EXP)
  if (NOT (HAVE_LOG AND HAVE_EXP))
    unset(HAVE_LOG CACHE)
    unset(HAVE_EXP CACHE)
    set(CMAKE_REQUIRES_LIBRARIES "m")
    check_symbol_exists(log "math.h" HAVE_LOG)
    chack_symbol_exists(exp "math.h" HAVE_EXP)
    if (HAVE_LOG AND HAVE_EXP)
      target_link_libraries(MathFunctions PRIVATE m)
    endif()
  endif()

If available, use target_compile_definitions() to specify ``HAVE_LOG``
and ``HAVE_EXP`` as ``PRIVATE`` compile definitions.

.. code-block::

  if (HAVE_LOG AND HAVE_EXP)
    target_compile_definitions(MathFunctions
                               PRIVATE "HAVE_LOG" "HAVE_EXP")
  endif()

If ``log``` and ``exp`` are available on the system, then we will use them
to compute the square root in the ``mysqrt`` function. Add the following
code to the ``mysqrt`` function in ``MathFunctions/mysqrt.cpp`` (don't forget
the ``#endif`` before returning the result!):

.. code-block::

  #if defined(HAVE_LOG) && defined(HAVE_EXP)
    double result = exp(log(x) * 0.5);
    std::cout << "Computing sqrt of " << x << " to be " << result
              << " using log and exp\n";
  #else
    double result = x;

We also need to modify ``mysqrt.cpp`` to include ``cmath``

Run the ``cmake`` executable or the ``cmake-gui`` to configure the project
and then build it with your chosen build tool and run the Tutorial executable.
