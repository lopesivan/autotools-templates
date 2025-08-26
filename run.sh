#!/usr/bin/env bash

BAKEFILE_HOME=$HOME/wx/linux-wx-3.2.4
ACLOCAL_HOME=$HOME/wx/wxWidgets-3.2.4-linux/build/aclocal

PYENV_VERSION=2.7.18 \
    $BAKEFILE_HOME/bin/bakefile -f autoconf hello.bkl

#mkdir -p m4 && mv autoconf_inc.m4 m4/
PYENV_VERSION=2.7.18 \
    $BAKEFILE_HOME/bin/bakefilize --copy &&
    aclocal -I $ACLOCAL_HOME &&
    autoconf

exit 0
