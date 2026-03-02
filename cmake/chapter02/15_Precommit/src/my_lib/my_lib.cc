#include "my_lib.h"
#include <cstdint>
#include <iostream>

void print_hello_world() { std::cout << "Hello world!" << std::endl; }

std::uint32_t factorial(unsigned int n)
{
    return n <= 1 ? 1 : factorial(n - 1) * n;
}
