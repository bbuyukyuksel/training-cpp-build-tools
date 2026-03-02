#include <iostream>

#include <cxxopts.hpp>
#include <fmt/format.h>
#include <fstream>
#include <nlohmann/json.hpp>
#include <spdlog/spdlog.h>

#include "config.hpp"
#include "my_lib.h"

void print_lib_details();
void print_project_detail();
void print_build_type();

int main(int argc, char *argv[])
{
    print_lib_details();
    print_project_detail();
    print_build_type();
    print_hello_world();

    // Compiler warning and clang tidy error
    // std::int32_t i = 0;

    // Address Sanitizer should see this
    // char x[10];
    // int i = 5;

    const auto welcome_message =
        fmt::format("Welcome to {} v{}!", project_name, project_version);
    spdlog::info(welcome_message);

    cxxopts::Options options{project_name.data(), welcome_message};

    options.add_options("arguments")("h,help", "Print help")(
        "f,filename", "Input file name", cxxopts::value<std::string>())(
        "v,verbose",
        "Verbose output",
        cxxopts::value<bool>()->default_value("false"));

    const auto result = options.parse(argc, argv);

    if (argc == 1 || result.count("help"))
    {
        std::cout << options.help() << std::endl;
        return 0;
    }

    auto filename = std::string{};
    auto verbose = false;

    if (result.count("filename"))
    {
        filename = result["filename"].as<std::string>();
    }
    else
    {
        return 1;
    }

    if (result.count("verbose"))
    {
        verbose = result["verbose"].as<bool>();
    }

    if (verbose)
    {
        spdlog::info("Opening ile: {}", filename);
    }

    auto ifs = std::ifstream{filename};

    if (!ifs.is_open())
    {
        spdlog::error("Failed to open file: {}", filename);
        return 1;
    }

    const auto parsed_data = nlohmann::json::parse(ifs);
    spdlog::info("Parsed JSON data: {}", parsed_data.dump(4));

    if (verbose)
    {
        const auto name = parsed_data["name"].get<std::string>();
        fmt::print("Name from JSON: {}\n", name);
    }
}

void print_lib_details()
{
    std::cout << "JSON:" << NLOHMANN_JSON_VERSION_MAJOR << "."
              << NLOHMANN_JSON_VERSION_MINOR << "."
              << NLOHMANN_JSON_VERSION_PATCH << std::endl;
    std::cout << "FMT:" << FMT_VERSION << std::endl;
    std::cout << "SPDLOG:" << SPDLOG_VER_MAJOR << "." << SPDLOG_VER_MINOR << "."
              << SPDLOG_VER_PATCH << std::endl;
    std::cout << "CXXOPTS:" << CXXOPTS__VERSION_MAJOR << "."
              << CXXOPTS__VERSION_MINOR << "." << CXXOPTS__VERSION_PATCH
              << std::endl;
}

void print_project_detail()
{
    std::cout << project_name << ": " << project_version << std::endl;
}

void print_build_type()
{
#ifdef NDEBUG
    std::cout << "Build Type: Release" << std::endl;
#else
    std::cout << "Build Type: Debug" << std::endl;
#endif
}
