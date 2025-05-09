ACLOCAL_AMFLAGS = ${ACLOCAL_FLAGS}

# Biblioteca estática
lib_LIBRARIES = libminhalib.a

# Fontes da biblioteca
libminhalib_a_SOURCES = src/minha_lib.c include/minha_lib.h

# Versionamento (formato: current:revision:age)
libminhalib_la_LDFLAGS = -version-info 0:0:0

# Diretório de cabeçalhos públicos
include_HEADERS = include/minha_lib.h

# Flags de compilação
AM_CFLAGS = -Wall -fPIC -I$(srcdir)/include
