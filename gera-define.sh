#!/usr/bin/env bash

# Script: gera-with-opcao.sh
if [[ $# -lt 3 ]]; then
    echo "Uso: $0 <nome_da_opcao> <value> <descricao>"
    echo "Exemplo: $0 AUTHOR_NAME \"Ivan\" \"Nome do autor\""
    exit 1
fi

option="$1"
value="$2"
description="$3"
define_name=$(echo "$option" | tr '[:lower:]' '[:upper:]')

cat <<EOF
AC_DEFINE([$define_name], [$value], [$description])
EOF

echo "Adicione o bloco acima ao configure.ac!" >&2
