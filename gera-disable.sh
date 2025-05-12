#!/usr/bin/env bash

# Script: gera-disable-opcao.sh
if [[ $# -lt 2 ]]; then
    echo "Uso: $0 <nome_da_opcao> <descricao>"
    echo "Exemplo: $0 security 'desabilita verificações de segurança'"
    exit 1
fi

option="$1"
description="$2"
define_name=$(echo "$option" | tr '[:lower:]' '[:upper:]')

DOLAR='$'
cat <<EOF
dnl --disable-${option} => adiciona #define ${define_name} 1
AC_ARG_ENABLE([${option}],
  AS_HELP_STRING([--disable-${option}], [${description}]),
  [test "x${DOLAR}enable_${option}" = xno && AC_DEFINE([${define_name}], [1],
               [Define para ${description}])])

EOF

echo "Adicione o bloco acima ao configure.ac!"

exit 0
