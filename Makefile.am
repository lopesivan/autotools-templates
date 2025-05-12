AUTOMAKE_OPTIONS = subdir-objects
ACLOCAL_AMFLAGS = ${ACLOCAL_FLAGS}

bin_PROGRAMS = hello
hello_CFLAGS = -I$(top_srcdir)/src
hello_SOURCES = src/main.c

if CONFIG_TEX
hello_CFLAGS  = -D${OPENSSL_PATH}
# hello_LDADD   = -L${OPENSSL_PATH}
endif
