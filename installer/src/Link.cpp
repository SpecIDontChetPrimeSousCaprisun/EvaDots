#include <cstdlib>
#include <chrono>

#include "Link.hpp"
#include "Logger.hpp"

std::vector<Link> Link::links;
fs::path Link::exeLocation = fs::read_symlink("/proc/self/exe");

Link::Link(fs::path path, fs::path target) : path(path), target(target) {}

void Link::init() {
    fs::path home = std::getenv("HOME");
    fs::path root = exeLocation.parent_path().parent_path();

    links.push_back(Link(root / "quickshell", home / ".config/quickshell"));
    links.push_back(Link(root / ".zshrc", home / ".zshrc"));
    links.push_back(Link(root / ".zprofile", home / ".zprofile"));
    links.push_back(Link(root / "hypr", home / ".config/hypr"));
    links.push_back(Link(root / "nvim", home / ".config/nvim"));
    links.push_back(Link(root / "fastfetch", home / ".config/fastfetch"));
    links.push_back(Link(root / "tmux", home / ".config/tmux"));
    links.push_back(Link(root / "kitty", home / ".config/kitty"));
    links.push_back(Link(root / "walls", home / "walls"));
    links.push_back(Link(root / "powerlevel10k", home / "powerlevel10k"));
}

void Link::linkFiles() {
    auto now = std::chrono::system_clock::now();
    std::time_t t = std::chrono::system_clock::to_time_t(now);
    std::tm tm{};
    localtime_r(&t, &tm);  

    std::ostringstream oss;
    oss << std::put_time(&tm, "%Y%m%d-%H%M%S");

    for (Link link : links) {
	fs::create_directories(link.target.parent_path());
	
	if (fs::exists(link.target) || fs::is_symlink(link.target)) {
	    fs::rename(link.target, link.target.string() + ".bak." + oss.str());
	    Logger::log("Created backup " + link.target.string() + ".bak." + oss.str());
	}

	fs::create_symlink(link.path, link.target);
	Logger::log("Linked " + link.path.string() + " to " + link.target.string());
    }
}

