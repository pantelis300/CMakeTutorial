#include <cmath>
#include <cstdlib>
#include <iostream>
#include <string>

int main(int argc, char **argv) {
  if (argc < 2) {
    std::cout << "Usage: " << argv[0] << " number\n";
    return EXIT_FAILURE;
  }
  
  const double inputValue = atof(argv[1]);
  const double outputValue = sqrt(inputValue);
  std::cout << "The square root of " << inputValue << " is "
            << outputValue << '\n';
}
