#include <cstdio>

#include "Dependency.hpp"
#include "Logger.hpp"

std::string Dependency::pkgManager;
std::vector<Dependency> Dependency::dependencies;

Dependency::Dependency(std::string name, std::string command, bool aur) : name(name), command(command), aur(aur) {}

std::string Dependency::getPkgManager() {
    if (std::system("which pacman > /dev/null 2>&1") == 0) {
	installYay();
	return "pacman";
    }
    if (std::system("which apt > /dev/null 2>&1") == 0) return "apt";
    if (std::system("which dnf > /dev/null 2>&1") == 0) return "dnf";

    return "";
}

void Dependency::installYay() {
    if (checkForCommand("yay") == 0) {
	Logger::log("Yay is aldready installed");
	return;
    }

    Logger::log("Installing yay");

    int clone = std::system("git clone https://aur.archlinux.org/yay.git");
    int makepkg = std::system("cd yay && makepkg -si");

    if (clone != 0 || makepkg != 0) Logger::error("Failed installing yay");
}

void Dependency::init() {
    dependencies.push_back(Dependency("hyprland", "start-hyprland"));
    dependencies.push_back(Dependency("quickshell", "qs"));
    dependencies.push_back(Dependency("cava", "cava"));
    dependencies.push_back(Dependency("kitty", "kitty"));
    dependencies.push_back(Dependency("librewolf", "librewolf"));
    dependencies.push_back(Dependency("awww", "awww"));
    dependencies.push_back(Dependency("zsh", "zsh"));
    dependencies.push_back(Dependency("grim", "grim"));
    dependencies.push_back(Dependency("slurp", "slurp"));
    dependencies.push_back(Dependency("fastfetch", "fastfetch"));
    dependencies.push_back(Dependency("wl-clipboard", "wl-copy"));
    dependencies.push_back(Dependency("rofi", "rofi"));
    dependencies.push_back(Dependency("vesktop-bin", "vesktop", true));
    dependencies.push_back(Dependency("ttf-jetbrains-mono-nerd", "some random fuckass command that will never work"));
}

int Dependency::checkForCommand(std::string cmd) {
    std::string check = "which " + cmd + " > /dev/null 2>&1";
    return std::system(check.c_str());
}

void Dependency::installDependency(Dependency dep) {
    std::string cmd;

    if (pkgManager == "pacman" && dep.aur) cmd = "yay -S --noconfirm " + dep.name;
    else if (pkgManager == "pacman") cmd = "sudo pacman -S --noconfirm " + dep.name;
    else if (pkgManager == "apt") cmd = "sudo apt install -y " + dep.name;
    else if (pkgManager == "dnf") cmd = "sudo dnf install -y " + dep.name;

    Logger::log("Installing " + dep.name);
    std::system(cmd.c_str());
}

void Dependency::installDependencies() {
    pkgManager = getPkgManager();

    if (pkgManager.empty()) Logger::error("Unsupported distro / OS");

    Logger::log("Detected package manager: " + pkgManager);

    for (Dependency dep : dependencies) {
	if (checkForCommand(dep.command) == 0) {
	    Logger::log("Dependency " + dep.name + " is aldready installed");
	} else {
	    installDependency(dep);
	}
    }

    postInstall();
}

void Dependency::postInstall() {
    Logger::log("Setting zsh as main shell");
    if (std::system("chsh -s $(which zsh)") != 0) std::system("chsh -s /usr/bin/zsh");
}
