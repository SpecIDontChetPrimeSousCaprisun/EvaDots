#include <iostream>

#include "Logger.hpp"

void Logger::log(std::string text) {
    std::cout << "\033[32m[INFO] \033[0m" << text << "\n";
}

void Logger::warn(std::string text) {
    std::cout << "\033[33m[WARNING] \033[0m" << text << "\n";
}

void Logger::error(std::string text) {
    std::cout << "\033[31m[ERROR] \033[0m" << text << "\n";
    exit(1);
}
