#!/usr/bin/env bash

./gera-disable.sh security 'desabilita verificações de segurança'
./gera-enable.sh debug 'Define para compilar código de depuração'
./gera-with.sh openssl 'usa biblioteca OpenSSL do diretório especificado'
./gera-define.sh default_port 8080 'Porta padrão'

exit 0
