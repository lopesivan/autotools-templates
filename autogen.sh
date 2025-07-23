#!/bin/sh

aclocal
#autoheader
automake --add-missing
autoconf

#touch NEWS README AUTHORS ChangeLog COPYING
#autoreconf -i -v && ./configure && make

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
else
    echo "Erro ao gerar configuração!"
    exit 1
fi
exit 0
