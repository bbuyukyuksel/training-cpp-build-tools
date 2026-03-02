#include <iostream>

namespace headerlib
{
    template <typename T>
    void printer(T value);
}

template <typename T>
void headerlib::printer(T value)
{
    std::cout << "Value: " << value << std::endl;
}
