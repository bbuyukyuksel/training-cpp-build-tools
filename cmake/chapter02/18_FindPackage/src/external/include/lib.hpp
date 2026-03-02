#pragma once

#include <iostream>

namespace headerlib
{
    template <typename T>
    void printer(T value) = delete;

    void printer(int value);
}
