#ifndef HELLO_HPP
#define HELLO_HPP

#include <string>

class HelloWorld {
public:
    HelloWorld(std::string mensagem);
    void show() const;

private:
    std::string _mensagem;
};

#endif // HELLO_HPP
