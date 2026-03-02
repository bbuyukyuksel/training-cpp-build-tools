// #define CATCH_CONFIG_MAIN
#include "my_lib.h"
#include <catch2/catch_test_macros.hpp>

TEST_CASE("Factorials are computes - 1", "[factorial]") {
  REQUIRE(factorial(0) == 1);
  REQUIRE(factorial(1) == 1);
  REQUIRE(factorial(2) == 2);
  REQUIRE(factorial(3) == 6);
  REQUIRE(factorial(10) == 3628800);
}

TEST_CASE("Factorials are computes - 2", "[factorial]") {
  REQUIRE(factorial(5) == 120);
}
