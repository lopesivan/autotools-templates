dnl ====== Metadados do pacote ===============================================
AC_PREREQ([2.69])
AC_INIT([hello], [0.1.0], [you@example.com],
        [hello], [http://example.com/])

# Force autoconf to be at least this version number:
AC_PREREQ([2.68])

AM_INIT_AUTOMAKE([1.10 -Wall no-define foreign])

dnl ====== Arquivo âncora (main.c) ===========================================
AC_CONFIG_SRCDIR([src/main.c])

dnl ====== bibliotescas ======================================================
PKG_PROG_PKG_CONFIG
#CFLAGS = `pkg-config --cflags libavutil libavformat libswscale libavcodec`
#LDLIBS = `pkg-config --libs libavutil libavformat libswscale libavcodec`
PKG_CHECK_MODULES(FFMPEG, [libavutil libavformat libswscale libavcodec])

AC_SUBST(FFMPEG_CFLAGS)
AC_SUBST(FFMPEG_LIBS)

# Configurações adicionais para wxWidgets
CFLAGS="$CFLAGS ${FFMPEG_CFLAGS}"
LIBS="$LIBS ${FFMPEG_LIBS}"

dnl ====== Opções de debug ===================================================
AC_ARG_ENABLE([debug],
    AS_HELP_STRING([--enable-debug], [Habilitar modo debug]),
    [debug=$enableval],
    [debug=no])

if test "x$debug" = "xyes"; then
    CFLAGS="$CFLAGS -g -O0 -DDEBUG"
else
    CFLAGS="$CFLAGS -O2 -DNDEBUG"
fi

dnl ====== Compilador ========================================================
AC_PROG_CC
AC_PROG_CC_C_O

AC_CANONICAL_HOST
AC_CONFIG_FILES([Makefile])

AC_OUTPUT          dnl fecha o script

echo "
$PACKAGE_NAME $PACKAGE_VERSION

    Configuração:
    Debug:              $debug

    Compilador:         $CC
    CFLAGS:             $CFLAGS
    LIBS:               $LIBS

    Agora execute 'make' para compilar.
"
