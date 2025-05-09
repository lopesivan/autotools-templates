sh ./autogen.sh

CC=clang CXX=clang++ ./configure
./configure
make
./hello

CC=clang CXX=clang++ ./configure --enable-debug
make
./hello
