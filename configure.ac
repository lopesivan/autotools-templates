AC_PREREQ(2.53)
AC_INIT([hello], [1.0], [author@example.com])
dnl pass some unique file file to AC_CONFIG_SRCDIR
AC_CONFIG_SRCDIR([autoconf_inc.m4])
AC_CANONICAL_HOST

dnl ===========================================================
dnl    wxWidgets
dnl ===========================================================
AC_ARG_VAR([WX_CONFIG], [Caminho para o wx-config])
AC_PATH_PROG([WX_CONFIG], [wx-config], [no])

if test "$WX_CONFIG" = "no"; then
    AC_MSG_ERROR([wx-config não encontrado. Instale o pacote wxWidgets-dev])
fi

WX_CXXFLAGS="`$WX_CONFIG --cxxflags`"
WX_LIBS="`$WX_CONFIG --libs`"

AC_SUBST([WX_CXXFLAGS])
AC_SUBST([WX_LIBS])

AC_BAKEFILE([m4_include(autoconf_inc.m4)])
AC_CONFIG_FILES([Makefile])
AC_OUTPUT
