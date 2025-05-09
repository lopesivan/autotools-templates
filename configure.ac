dnl ====== Metadados do pacote ===============================================
AC_PREREQ([2.69])
AC_INIT([hello], [0.1.0], [you@example.com])

dnl ====== Configurando opções ===============================================
AM_INIT_AUTOMAKE([-Wall -Werror foreign subdir-objects])

dnl ====== Arquivo âncora (minha_lib.c) ======================================
AC_CONFIG_SRCDIR([src/minha_lib.c])
AC_CANONICAL_HOST

dnl ====== Compilador ========================================================
AC_PROG_CC
AC_PROG_RANLIB
AC_CONFIG_FILES([Makefile])

AC_OUTPUT
