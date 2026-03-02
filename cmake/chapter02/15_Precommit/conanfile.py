from conan import ConanFile
from conan.tools.cmake import CMake, CMakeToolchain, cmake_layout

class CompressorRecipe(ConanFile):
    name = "conan-training"
    version = "0.1"
    settings = "os", "compiler", "build_type", "arch"
    generators = "CMakeDeps"

    def requirements(self):
        self.requires("nlohmann_json/3.11.2")
        self.requires("fmt/10.0.0")
        self.requires("spdlog/1.11.0")
        self.requires("catch2/3.4.0")
        self.requires("cxxopts/3.1.1")

    def layout(self):
        cmake_layout(self)

    def generate(self):
        tc = CMakeToolchain(self)
        tc.user_presets_path = False
        tc.variables["ENABLE_TESTING"] = False
        tc.variables["ENABLE_DOCS"] = False
        tc.variables["ENABLE_WARNINGS"] = False
        tc.variables["ENABLE_WARNINGS_AS_ERROR"] = False
        tc.variables["ENABLE_ADDRESS_SANITIZER"] = False
        tc.variables["ENABLE_THREAD_SANITIZER"] = False
        tc.variables["ENABLE_UNDEFINED_BEHAVIOR_SANITIZER"] = False
        tc.variables["ENABLE_LTO"] = False
        tc.variables["ENABLE_CONAN"] = True
        tc.generate()

    def build(self):
        cmake = CMake(self)
        cmake.configure()
        cmake.build()
