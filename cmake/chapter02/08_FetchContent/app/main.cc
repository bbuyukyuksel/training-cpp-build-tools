#include <iostream>

#include <nlohmann/json.hpp>
#include <fmt/format.h>
#include <spdlog/spdlog.h>
#include <cxxopts.hpp>

#include "my_lib.h"
#include "config.hpp"

int main()
{
    std::cout << project_name << ": " << project_version << std::endl;
    print_hello_world();
    std::cout << "JSON:" << NLOHMANN_JSON_VERSION_MAJOR << "." << NLOHMANN_JSON_VERSION_MINOR << "." << NLOHMANN_JSON_VERSION_PATCH << std::endl;
    std::cout << "FMT:" << FMT_VERSION << std::endl;
    std::cout << "SPDLOG:" << SPDLOG_VER_MAJOR << "." << SPDLOG_VER_MINOR << "." << SPDLOG_VER_PATCH << std::endl;
    std::cout << "CXXOPTS:" << CXXOPTS__VERSION_MAJOR << "." << CXXOPTS__VERSION_MINOR << "." << CXXOPTS__VERSION_PATCH << std::endl;
}