AC_PREREQ(2.53)
AC_INIT([hello], [1.0], [author@example.com])
dnl pass some unique file file to AC_CONFIG_SRCDIR
AC_CONFIG_SRCDIR([autoconf_inc.m4])
AC_CANONICAL_HOST

# Suporte a debug
AC_ARG_ENABLE([debug],
    AS_HELP_STRING([--enable-debug], [Habilitar modo de depuração]),
    [debug=$enableval],
    [debug=no])

if test "x$debug" = "xyes"; then
    CFLAGS="$CFLAGS -g -O0 -DDEBUG"
else
    CFLAGS="$CFLAGS -O2 -DNDEBUG"
fi

AC_BAKEFILE([m4_include(autoconf_inc.m4)])
AC_CONFIG_FILES([Makefile])
AC_OUTPUT
