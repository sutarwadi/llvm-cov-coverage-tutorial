#include <iostream>

double square(double a)
{
  return a * a;
}

double cube(double a)
{
  return a * a * a;
}

double fourth(double a)
{
  return a * a * a * a;
}



int main(int argc, [[maybe_unused]] char** argv)
{
  if (argc == 2) {
    auto b = square(5.0);
    std::cout << "Value = " << b << std::endl;
  }

  if (argc == 3) {
    auto c = cube(5.0);
    std::cout << "Value = " << c << std::endl;
  }
  return EXIT_SUCCESS;
}
