AC_PREREQ(2.53)
AC_INIT([hello], [1.0], [author@example.com])
dnl pass some unique file file to AC_CONFIG_SRCDIR
AC_CONFIG_SRCDIR([autoconf_inc.m4])
AC_CANONICAL_HOST
DEBUG=0

# Suporte a debug
AC_ARG_ENABLE([debug],
    AS_HELP_STRING([--enable-debug], [Habilitar modo de depuração]),
    [debug=$enableval],
    [debug=no])

if test "x$debug" = "xyes"; then
    DEBUG=1
#    CFLAGS="$CFLAGS -g -O0 -DDEBUG"
#else
#    DEBUG=0
#    CFLAGS="$CFLAGS -O2 -DNDEBUG"
fi

AC_BAKEFILE([m4_include(autoconf_inc.m4)])
AC_CONFIG_FILES([Makefile])
AC_OUTPUT
