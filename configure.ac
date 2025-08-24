dnl ====== Metadados do pacote ===============================================
AC_PREREQ([2.69])
AC_INIT([hello], [0.1.0], [you@example.com])

AM_INIT_AUTOMAKE([foreign -Wall -Werror])
AC_CONFIG_SRCDIR([src/main.c])
AC_CONFIG_HEADERS([config.h])

# Verifica se o compilador C está disponível
AC_PROG_CC
AC_PROG_CC_C_O
AC_CANONICAL_HOST

# Usa pkg-config para localizar GTK+ 3
PKG_CHECK_MODULES([GTK], [gtk+-3.0])

# Exporta flags para Makefile
AC_SUBST([GTK_CFLAGS])
AC_SUBST([GTK_LIBS])

# Gera arquivos de saída
AC_CONFIG_FILES([Makefile])
AC_OUTPUT
