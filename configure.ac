dnl ====== Metadados do pacote ===============================================
AC_PREREQ([2.69])
AC_INIT([hello], [0.1.0], [you@example.com],
        [hello], [http://example.com/])

# Force autoconf to be at least this version number:
AC_PREREQ([2.68])

AM_INIT_AUTOMAKE([1.10 -Wall no-define foreign])

# Put autotools auxiliary files in a subdir, so they don't clutter top dir:
AC_CONFIG_AUX_DIR([build-aux])

# The modern autotools convention is that you should use an “m4” subdirectory
# for internal “m4” files, instead of the default aclocal.m4.
#AC_CONFIG_MACRO_DIR([m4])

dnl ====== Arquivo âncora (main.c) ===========================================
AC_CONFIG_SRCDIR([src/main.c])

dnl ====== bibliotescas ======================================================
PKG_PROG_PKG_CONFIG
#CFLAGS = `pkg-config --cflags libavutil libavformat libswscale libavcodec`
#LDLIBS = `pkg-config --libs libavutil libavformat libswscale libavcodec`
PKG_CHECK_MODULES(FFMPEG, [libavutil libavformat libswscale libavcodec])

AC_SUBST(FFMPEG_CFLAGS)
AC_SUBST(FFMPEG_LIBS)

dnl ====== Compilador ========================================================
AC_PROG_CC
AC_PROG_CC_C_O

AC_CANONICAL_HOST
AC_CONFIG_FILES([Makefile])

AC_OUTPUT          dnl fecha o script
