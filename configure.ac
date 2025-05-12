dnl ====== Metadados do pacote ===============================================
AC_PREREQ([2.69])
AC_INIT([hello], [0.1.0], [you@example.com])

AM_INIT_AUTOMAKE([1.10 -Wall no-define foreign])

dnl ====== Arquivo âncora (main.c) ===========================================
AC_CONFIG_SRCDIR([src/main.c])

dnl ====== Gerar config.h ====================================================
AC_CONFIG_HEADERS([config.h])

dnl ====== Definições que irão para config.h =================================
AC_DEFINE([AUTHOR_NAME], ["Ivan"], [Nome do autor])
AC_DEFINE([DEFAULT_PORT], [8080], [Porta padrão])

dnl --enable-debug => adiciona #define DEBUG 1
dnl $ ./gera-enable.sh debug 'Define para compilar código de depuração'
AC_ARG_ENABLE([debug],
  AS_HELP_STRING([--enable-debug], [Define para compilar código de depuração]),
  [test "x\$enable_debug" = xyes && AC_DEFINE([DEBUG], [1],
               [Define para Define para compilar código de depuração])])

dnl --enable-abobrinha => adiciona #define ABOBRINHA 1
dnl ./gera-enable.sh abobrinha 'O gato mais velho, o meu filho amado.'
AC_ARG_ENABLE([abobrinha],
  AS_HELP_STRING([--enable-abobrinha], [O gato mais velho, o meu filho amado.]),
  [test "x\$enable_abobrinha" = xyes && AC_DEFINE([ABOBRINHA], [1],
               [Define para O gato mais velho, o meu filho amado.])])


dnl --disable-security => adiciona #define SECURITY 1
dnl $ ./gera-disable.sh security 'desabilita verificações de segurança'
AC_ARG_ENABLE([security],
  AS_HELP_STRING([--disable-security], [desabilita verificações de segurança]),
  [test "x\$enable_security" = xno && AC_DEFINE([SECURITY], [1],
               [Define para desabilita verificações de segurança])])

dnl ====== Compilador ========================================================
AC_PROG_CC
AC_PROG_CC_C_O

AC_CANONICAL_HOST
AC_CONFIG_FILES([Makefile])

AC_OUTPUT          dnl fecha o script
