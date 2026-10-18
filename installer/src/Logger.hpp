#pragma once

#include <string>

class Logger {
public:
    static void log(std::string);
    static void warn(std::string);
    static void error(std::string);
};
