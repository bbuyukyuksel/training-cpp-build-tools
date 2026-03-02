#include <iostream>

#include <nlohmann/json.hpp>
#include <fmt/format.h>
#include <spdlog/spdlog.h>
#include <cxxopts.hpp>

#include "my_lib.h"
#include "config.hpp"

void print_build_type()
{
#ifdef NDEBUG
    std::cout << "Build Type: Release" << std::endl;
#else
    std::cout << "Build Type: Debug" << std::endl;
#endif
}

int main()
{
    print_build_type();

    char x[10];
    int i = 5;

    auto output = fmt::format("Hello, {}!", "World");
    std::cout << project_name << ": " << project_version << std::endl;
    print_hello_world();
    fmt::print("{}\n", output);
    std::cout << "JSON:" << NLOHMANN_JSON_VERSION_MAJOR << "." << NLOHMANN_JSON_VERSION_MINOR << "." << NLOHMANN_JSON_VERSION_PATCH << std::endl;
    std::cout << "FMT:" << FMT_VERSION << std::endl;
    std::cout << "SPDLOG:" << SPDLOG_VER_MAJOR << "." << SPDLOG_VER_MINOR << "." << SPDLOG_VER_PATCH << std::endl;
    std::cout << "CXXOPTS:" << CXXOPTS__VERSION_MAJOR << "." << CXXOPTS__VERSION_MINOR << "." << CXXOPTS__VERSION_PATCH << std::endl;
}