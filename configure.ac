AC_INIT([spinapp], [1.0], [seu-email@exemplo.com])
AM_INIT_AUTOMAKE([-Wall -Werror foreign])
AC_CONFIG_SRCDIR([src/main.cpp])
AC_CONFIG_HEADERS([config.h])
AC_LANG([C++])
AC_PROG_CXX

# wxWidgets usando wxwin.m4
AM_OPTIONS_WXCONFIG
reqwx=3.0.0
AM_PATH_WXCONFIG([$reqwx], [wxWin=yes], [wxWin=no])

if test "x$wxWin" != "xyes"; then
    AC_MSG_ERROR([
wxWidgets não encontrado ou versão insuficiente (>= $reqwx).

Certifique-se de que:
  - O pacote de desenvolvimento do wxWidgets está instalado.
  - O utilitário 'wx-config' está no PATH.
  - A versão instalada é >= $reqwx.
])
fi

# Adiciona os flags do wxWidgets ao ambiente
CPPFLAGS="$CPPFLAGS $WX_CPPFLAGS"
CXXFLAGS="$CXXFLAGS $WX_CXXFLAGS_ONLY"
CFLAGS="$CFLAGS $WX_CFLAGS_ONLY"
LIBS="$LIBS $WX_LIBS"

# Suporte opcional a XRC
AC_ARG_ENABLE([xrc],
    AS_HELP_STRING([--enable-xrc], [Habilitar suporte a XRC (default: sim)]),
    [use_xrc=$enableval],
    [use_xrc=yes])

if test "x$use_xrc" = "xyes"; then
    AC_MSG_CHECKING([se wxWidgets suporta XRC])
    wx_config_libs=`$WX_CONFIG_WITH_ARGS --libs`
    if echo "$wx_config_libs" | grep -q "xrc"; then
        AC_MSG_RESULT([sim])
        AC_DEFINE([HAVE_XRC], [1], [Define se XRC está disponível])
        XRC_LIBS=`$WX_CONFIG_WITH_ARGS --libs xrc`
        LIBS="$LIBS $XRC_LIBS"
    else
        AC_MSG_RESULT([não])
        use_xrc=no
    fi
fi

AM_CONDITIONAL([USE_XRC], [test "x$use_xrc" = "xyes"])

# Verifica pthread (usado por wx geralmente)
AC_CHECK_LIB([pthread], [pthread_create])

# Suporte a debug
AC_ARG_ENABLE([debug],
    AS_HELP_STRING([--enable-debug], [Habilitar modo de depuração]),
    [debug=$enableval],
    [debug=no])

if test "x$debug" = "xyes"; then
    CXXFLAGS="$CXXFLAGS -g -O0 -DDEBUG"
else
    CXXFLAGS="$CXXFLAGS -O2 -DNDEBUG"
fi

# Arquivos de saída
AC_CONFIG_FILES([
    Makefile
    src/Makefile
])

AC_OUTPUT

echo "
$PACKAGE_NAME $PACKAGE_VERSION configurado com sucesso!

    Debug:              $debug
    Suporte XRC:        $use_xrc
    Compilador:         $CXX
    CXXFLAGS:           $CXXFLAGS
    LIBS:               $LIBS

Execute 'make' para compilar.
"
