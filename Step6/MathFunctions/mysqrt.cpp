#include <iostream>
#include "MathFunctions.h"

// Include the generated table.
#include "Table.h"

// A hack square root calculation using simple operations
double mysqrt(double x) {
  if (x <= 0)
    return 0;

  // Use the table to help find the initial value
  double result = x;
  if (x >= 1 && x < 10) {
    result = sqrtTable[static_cast<int>(x)];
    std::cout << "Use the table to help find an initial value ("
              << result << ")\n";
  }

  for (int i = 0; i < 10; ++i) {
    if (result <= 0)
      result = 0.1;

    double delta = x - (result * result);
    result += 0.5 * delta / result;
    std::cout << "Computing sqrt of " << x
	            << " to be " << result << '\n';
  }
  return result;
}
