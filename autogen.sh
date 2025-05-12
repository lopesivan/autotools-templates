#!/bin/sh

aclocal
autoheader
automake --add-missing
autoconf

#touch NEWS README AUTHORS ChangeLog COPYING
#autoreconf -i -v && ./configure && make
exit 0
