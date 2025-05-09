#!/bin/sh

set -e
aclocal
libtoolize --force
# autoheader
autoconf
automake --add-missing --foreign

exit 0
