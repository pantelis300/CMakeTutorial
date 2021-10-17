#include <cmath>
#include <iostream>
#include <string>

#include "TutorialConfig.h"

int main(int argc, char **argv) {
  if (argc < 2) {
    // Report Version
    std::cout << argv[0] << " Version " << Tutorial_VERSION_MAJOR
              << '.' << Tutorial_VERSION_MINOR << '\n';
    std::cout << "Usage: " << argv[0] << " number\n";
    return EXIT_FAILURE;
  }
  
  const double inputValue = std::stod(argv[1]);
  const double outputValue = sqrt(inputValue);
  std::cout << "The square root of " << inputValue << " is "
            << outputValue << '\n';
}
