// A simple program that build a sqrt table.
#include <cmath>
#include <cstdlib>
#include <fstream>
#include <iostream>

int main(int argc, char** argv) {
  // Make sure we have enough arguments
  if (argc < 2)
    return 1;

  std::ofstream fout(argv[1], std::ios_base::out);
  const bool fileOpen = fout.is_open();
  if (fileOpen) {
    fout << "double sqrtTable[] = {\n";
    for (int i = 0; i < 10; ++i)
      fout << sqrt(static_cast<double>(i)) << ",\n";

    fout << "0};\n";
    fout.close();
  }
  return fileOpen ? EXIT_SUCCESS : EXIT_FAILURE;
}
