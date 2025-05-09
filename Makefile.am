ACLOCAL_AMFLAGS = ${ACLOCAL_FLAGS}

# Biblioteca compartilhada em C++
lib_LTLIBRARIES = libminhalib.la

# Fontes da biblioteca (C++)
libminhalib_la_SOURCES = src/minha_lib.cpp include/minha_lib.hpp

# Diretório de headers públicos
include_HEADERS = include/minha_lib.hpp

# Flags de compilação para C++
AM_CXXFLAGS = -Wall -I$(srcdir)/include

# Flags de link da biblioteca (versão libtool)
libminhalib_la_LDFLAGS = -version-info 0:0:0 -no-undefined
