#ifdef HAVE_CONFIG_H
#include "config.h"
#endif

#include "hello.hpp"
#include <iostream>

int main() {
    HelloWorld obj("ola mundo");
    obj.show();

    std::cout << "Autor: " << AUTHOR_NAME << '\n';
    std::cout << "Versão: " << PACKAGE_VERSION << '\n';
    std::cout << "Porta: " << DEFAULT_PORT << '\n';

#ifdef DEBUG
    std::cout << "Compilado com DEBUG!" << '\n';
#endif
    return 0;
}
