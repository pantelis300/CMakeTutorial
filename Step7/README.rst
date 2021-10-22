Step 7: Packaging an Installer
==============================

Next suppose that we want to distribute our project to other people
so they can use it. We want to provide both binary and source distributions
on a variety of platforms. This is a little different from the the install
we did previously in ``Installing and Testing``, where we were installing
the binaries that we had built from the source code. In this example we will
be building installation packages that support binary installations and package
management features. To accomplish this we will use CPack to create platform
specific installers. Specifically we need to add a few lines to the bottom of
our top-level ``CMakeLists.txt`` file.

.. code-block:

  include(InstallRequiredSystemLibraries)
  set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_CURRENT_SOURCE_DIR}/License.txt")
  set(CPACK_PACKAGE_VERSION_MAJOR "${Tutorial_VERSION_MAJOR}")
  set(CPACK_PACKAGE_VERSION_MINOR "${Tutorial_VERSION_MINOR}")
  include(CPack)


That is all there is to it. We start by including ``InstallRequiredSystemLibraries.``
This module will include any runtime libraries that are needed by the project for
the current platform. Next we set some CPack variables to where we have stored the
license and version information for this project. The version information was set
eaerlier in this tutorial and the ``License.txt`` has been included in the top-level
source directory for this step.

Finally we include the ``CPack module`` which will use these variable and some other
properties of the current system to setup an installer.

The next step is to build the project in the usual manner and then run the ``cpack``
executable. To build a binary distribution, from the binary directory run:

.. code-block:: console

  $ cpack

To specify the generator, use the ``-G`` option. For multi-config builds, use ``-C``
to specify the configuration. For example:

.. code-block::

  $ cpack -G ZIP -C Debug

To create a source distribution you would type:

.. code-block::

  $ cpack --config CPackSourceConfig.cmake

Alternatively, run ``make package`` or right click the ``Package`` target and
``Build Project`` from an IDE.
Run the installer found in the binary directory. Then run the installed executable
and verify and verify that it works.

