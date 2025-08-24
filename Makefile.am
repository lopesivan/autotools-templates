AUTOMAKE_OPTIONS = subdir-objects
ACLOCAL_AMFLAGS = ${ACLOCAL_FLAGS}

bin_PROGRAMS = hello
hello_SOURCES = src/main.c

if WITH_OPENSSL
hello_CFLAGS = -I$(OPENSSL_PATH)/include
hello_LDADD    = -L$(OPENSSL_PATH)/lib -lssl -lcrypto
else
hello_CFLAGS = -I$(top_srcdir)/src
endif
