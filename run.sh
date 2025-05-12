sh ./autogen.sh

./configure
make
./hello

./configure --enable-debug
make
./hello

./configure --enable-abobrinha
make
./hello

./configure --disable-security
make
./hello
