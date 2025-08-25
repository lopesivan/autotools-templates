#!/bin/bash

aclocal
autoheader
automake --add-missing
autoconf

# Verificar se foi bem-sucedido
if [ $? -eq 0 ]; then
    echo ""
    echo "Configuração gerada com sucesso!"
    echo "Agora execute:"
    echo "  ./configure"
    echo "  make"
    echo ""
    echo "Opções úteis do configure:"
    echo "  --enable-debug     Habilitar modo debug"
    echo "  --disable-xrc      Desabilitar suporte XRC"
    echo "  --with-wx-config=PATH  Especificar caminho do wx-config"
else
    echo "Erro ao gerar configuração!"
    exit 1
fi
