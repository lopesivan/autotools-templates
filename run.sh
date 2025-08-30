#!/usr/bin/env bash
set -euo pipefail

# Caminho base onde ficam as dependências e fontes do wxWidgets
WX_BASE_DIR="$HOME/wx"

# Prefixo de instalação do wxWidgets (binários e ferramentas)
WX_INSTALL_DIR="$WX_BASE_DIR/linux-wx-3.2.4"

# Diretório do código-fonte do wxWidgets
WX_SOURCE_DIR="$WX_BASE_DIR/wxWidgets-3.2.4-linux"

# Diretório de macros aclocal
WX_ACLOCAL_DIR="$WX_SOURCE_DIR/build/aclocal"

# Versão do Python usada para executar bakefile
PYTHON_VERSION="2.7.18"

# === Gerar arquivos de build ===
PYENV_VERSION="$PYTHON_VERSION" \
    "$WX_INSTALL_DIR/bin/bakefile" -f autoconf hello.bkl

# === Inicializar sistema autoconf ===
PYENV_VERSION="$PYTHON_VERSION" \
    "$WX_INSTALL_DIR/bin/bakefilize" --copy

aclocal -I "$WX_ACLOCAL_DIR"
autoconf

./configure \
    --host=x86_64-w64-mingw32 \
    --build=x86_64-linux \
    --disable-unicode \
    --enable-monolithic \
    --disable-shared \
    CFLAGS=-m64 CXXFLAGS=-m64 LDFLAGS=-m64 &&
    make

exit 0
