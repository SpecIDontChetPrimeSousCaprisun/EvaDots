#include "Dependency.hpp"
#include "Link.hpp"

int main() {
    Dependency::init();
    Link::init();

    Dependency::installDependencies();
    Link::linkFiles();

    return 0;
}
