#pragma once

#include <cstdint>

/**
 * @file my_lib.h
 * @brief A simple library with utility functions.
 */

/**
 * @brief Prints "Hello world!" to the standard output.
 */
void print_hello_world();

/**
 * @brief Computes the factorial of a non-negative integer.
 * @param n The non-negative integer for which to compute the factorial.
 * @return The factorial of n.
 */
std::uint32_t factorial(unsigned int n);
