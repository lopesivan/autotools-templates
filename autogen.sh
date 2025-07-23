#!/bin/bash

# Script para gerar os arquivos de configuração
echo "Gerando arquivos de configuração..."

# Criar diretório m4 se não existir
mkdir -p m4

# Executar autoreconf
autoreconf --install --verbose --force

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
