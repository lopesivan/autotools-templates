# Configurações do programa principal
bin_PROGRAMS = spinapp

# Arquivos fonte do programa principal
spinapp_SOURCES = main.cpp \
                  SpinFrame.cpp \
                  SpinFrame.h

# Se XRC estiver habilitado, adicionar arquivos relacionados
if USE_XRC
spinapp_SOURCES += SpinFrameXRC.cpp \
                   SpinFrameXRC.h
endif

# Flags específicos para este programa
spinapp_CPPFLAGS = $(WX_CPPFLAGS)
spinapp_CXXFLAGS = $(WX_CXXFLAGS_ONLY)
spinapp_LDADD = $(WX_LIBS)

# Se XRC estiver habilitado
if USE_XRC
spinapp_LDADD += $(XRC_LIBS)
endif

# Headers que devem ser instalados (se for uma biblioteca)
# include_HEADERS = SpinFrame.h
