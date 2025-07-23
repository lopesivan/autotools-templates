AUTOMAKE_OPTIONS = subdir-objects
#AUTOMAKE_OPTIONS = foreign

#ACLOCAL_AMFLAGS = ${ACLOCAL_FLAGS}
#ACLOCAL_AMFLAGS  = -I m4 --install

bin_PROGRAMS  = hello
hello_SOURCES = src/main.c

#hello_CFLAGS  = -I$(top_srcdir)/src
hello_CFLAGS  = ${FFMPEG_CFLAGS}
hello_LDADD   = ${FFMPEG_LIBS}
