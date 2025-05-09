#!/bin/sh

aclocal
autoheader
automake --add-missing
autoconf

exit 0
