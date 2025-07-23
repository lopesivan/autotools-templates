AC_INIT([spinapp], [1.0], [seu-email@exemplo.com])
AM_INIT_AUTOMAKE([-Wall -Werror foreign])

# Verificar compilador C++
AC_PROG_CXX
AC_LANG([C++])

# Verificar wxWidgets
AM_OPTIONS_WXCONFIG
reqwx=3.0.0
AM_PATH_WXCONFIG($reqwx, wxWin=1)
if test "$wxWin" != 1; then
    AC_MSG_ERROR([
        wxWidgets deve estar instalado em seu sistema.

        Por favor, verifique se wx-config está no caminho,
        as bibliotecas wxWidgets estão instaladas corretamente,
        e que a versão seja $reqwx ou superior.
    ])
fi

# Configurações adicionais para wxWidgets
CPPFLAGS="$CPPFLAGS $WX_CPPFLAGS"
CXXFLAGS="$CXXFLAGS $WX_CXXFLAGS_ONLY"
CFLAGS="$CFLAGS $WX_CFLAGS_ONLY"
LIBS="$LIBS $WX_LIBS"

# Verificar se XRC está disponível (opcional)
AC_ARG_ENABLE([xrc],
    AS_HELP_STRING([--enable-xrc], [Habilitar suporte XRC]),
    [use_xrc=$enableval],
    [use_xrc=yes])

if test "x$use_xrc" = "xyes"; then
    # Verificar se wxWidgets foi compilado com suporte XRC
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

# Verificar bibliotecas adicionais
AC_CHECK_LIB([pthread], [pthread_create])

# Opções de debug
AC_ARG_ENABLE([debug],
    AS_HELP_STRING([--enable-debug], [Habilitar modo debug]),
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
    data/Makefile
])

AC_OUTPUT

echo "
$PACKAGE_NAME $PACKAGE_VERSION

    Configuração:
    Debug:              $debug
    Suporte XRC:        $use_xrc

    Compilador:         $CXX
    CXXFLAGS:           $CXXFLAGS
    LIBS:               $LIBS

    Agora execute 'make' para compilar.
"
