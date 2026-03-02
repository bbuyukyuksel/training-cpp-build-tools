#include <iostream>

#include <nlohmann/json.hpp>

#include "my_lib.h"
#include "config.hpp"

int main() {
    std::cout << project_name << ": " << project_version << std::endl;
    print_hello_world();
}