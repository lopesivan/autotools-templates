dnl ===========================================================
dnl    Metadados do pacote
dnl ===========================================================
AC_PREREQ([2.69])
AC_INIT([hello], [0.1.0], [you@example.com])
AM_INIT_AUTOMAKE([1.10 -Wall no-define foreign])
AC_CONFIG_SRCDIR([src/main.cpp])
AC_CONFIG_HEADERS([config.h])

dnl ===========================================================
dnl    Definições customizadas para config.h
dnl ===========================================================
AC_DEFINE([AUTHOR_NAME], ["Ivan"], [Nome do autor])
AC_DEFINE([DEFAULT_PORT], [8080], [Porta padrão])

dnl --enable-debug ⇒ define DEBUG em config.h
AC_ARG_ENABLE([debug],
    [AS_HELP_STRING([--enable-debug], [Compilar com código de depuração])],
    [test "x$enable_debug" = "xyes" && AC_DEFINE([DEBUG], [1],
        [Define para compilar código de depuração])]
)

dnl ===========================================================
dnl    Compilador
dnl ===========================================================
AC_PROG_CC
AC_PROG_CXX
AC_LANG([C++])

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

dnl ===========================================================
dnl    Arquivos de saída
dnl ===========================================================
AC_CONFIG_FILES([
    Makefile
    src/Makefile
])
AC_OUTPUT
