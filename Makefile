sources     = $(wildcard *.cpp)
program     = $(sources:.cpp=)
objects     = $(sources:.cpp=.o)

WX_CONFIG   = /home/ivan/wx/windows-wx-3.2.4/bin/wx-config
CXX         = `$(WX_CONFIG) --cxx`
WARNINGS    = -Wall
GDBFLAGS    = -g
LDLIBS      = `$(WX_CONFIG) --libs`

CPPFLAGS    = `$(WX_CONFIG) --cppflags` $(WARNINGS) $(GDBFLAGS)
#$(INCLUDE) $(DEFINEFLAGS)

all:          $(program)

$(program):

clean:
	/bin/rm -rf $(program).exe $(objects)

