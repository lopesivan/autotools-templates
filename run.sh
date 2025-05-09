sh ./autogen.sh

./configure
make
./hello

./configure --enable-debug
make
./hello
