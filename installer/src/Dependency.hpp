#pragma once

#include <string>
#include <vector>

class Dependency {
public:
    Dependency(std::string name, std::string command, bool aur = false);

    static void init();
    static void installDependencies();

    std::string name;
    std::string command;
    bool aur;
private:
    static std::string getPkgManager();
    static int checkForCommand(std::string cmd);
    static void installDependency(Dependency dep);
    static void installYay();

    static std::string pkgManager;
    static std::vector<Dependency> dependencies;
};
