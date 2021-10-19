#include <iostream>
#include <string>
#include "TutorialConfig.h"

#ifdef USE_MYMATH 
#  include "MathFunctions.h"
#else
#  include <cmath>
#endif

int main(int argc, char **argv) {
  if (argc < 2) {
    // Report Version
    std::cout << argv[0] << " Version " << Tutorial_VERSION_MAJOR
              << '.' << Tutorial_VERSION_MINOR << '\n';
    std::cout << "Usage: " << argv[0] << " number\n";
    return EXIT_FAILURE;
  }
  
  const double inputValue = std::stod(argv[1]);
#ifdef USE_MYMATH
  const double outputValue = mysqrt(inputValue);
  std::cout << "custom mysqrt():\n";
#else
  const double outputValue = sqrt(inputValue);
  std::cout << "sqrt() from cmath standard library:\n";
#endif
  std::cout << "The square root of " << inputValue << " is "
            << outputValue << '\n';
}
