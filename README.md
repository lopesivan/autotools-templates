# SpinApp - Aplicativo de Demonstração wxWidgets

## Compilação

### Pré-requisitos
- wxWidgets 3.0.0 ou superior
- autotools (autoconf, automake, libtool)
- Compilador C++ com suporte a C++11

### Ubuntu/Debian
```bash
sudo apt-get install libwxgtk3.0-gtk3-dev autotools-dev autoconf automake
```

### Fedora/CentOS
```bash
sudo dnf install wxGTK3-devel autoconf automake libtool
```

### Compilação
```bash
# Gerar arquivos de configuração
./autogen.sh

# Configurar
./configure

# Compilar
make

# Instalar (opcional)
sudo make install
```

### Opções de Configuração
- `--enable-debug`: Compilar em modo debug
- `--disable-xrc`: Desabilitar suporte XRC
- `--with-wx-config=PATH`: Especificar wx-config customizado

### Executar
```bash
# Interface padrão
./src/spinapp

# Com XRC (se disponível)
./src/spinapp --xrc
```

## Estrutura do Projeto
```
spinapp/
├── configure.ac        # Configuração do autoconf
├── Makefile.am        # Makefile principal
├── autogen.sh         # Script de geração
├── m4/wxwin.m4        # Macro do wxWidgets
├── src/
│   ├── Makefile.am    # Makefile do código fonte
│   ├── main.cpp       # Programa principal
│   ├── SpinFrame.cpp  # Interface padrão
│   └── SpinFrame.h
└── data/
    ├── Makefile.am    # Makefile dos dados
    └── spinapp.xrc    # Interface XRC
```
