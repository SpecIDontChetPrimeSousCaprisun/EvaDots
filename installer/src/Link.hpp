#pragma once

#include <filesystem>
#include <vector>

namespace fs = std::filesystem;

class Link {
public:
    Link(fs::path path, fs::path target);

    static void init();
    static void linkFiles();

    fs::path path;
    fs::path target;
private:
    static std::vector<Link> links;
    static fs::path exeLocation;
};
