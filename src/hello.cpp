#include "hello.hpp"
#include <iostream>

// Construtor
HelloWorld::HelloWorld(std::string mensagem) {
    this->_mensagem = mensagem;
}

// Método show
void HelloWorld::show() const {
    std::cout << "mensagem: "
              << this->_mensagem
              << std::endl;
}
