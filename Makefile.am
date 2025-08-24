AUTOMAKE_OPTIONS = subdir-objects
ACLOCAL_AMFLAGS = ${ACLOCAL_FLAGS}

bin_PROGRAMS = hello
hello_SOURCES = src/main.cpp
hello_CPPFLAGS = -I$(top_srcdir)/src @WX_CXXFLAGS@
hello_LDADD = @WX_LIBS@
