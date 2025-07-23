#!/usr/bin/env bash

# Script: gera-with-opcao.sh
if [[ $# -lt 2 ]]; then
    echo "Uso: $0 <nome_da_opcao> <descricao>"
    echo "Exemplo: $0 openssl 'usa biblioteca OpenSSL do diretório especificado'"
    exit 1
fi

option="$1"
description="$2"
define_name=$(echo "$option" | tr '[:lower:]' '[:upper:]')

DOLAR='$'
cat <<EOF
dnl --with-${option} => adiciona #define WITH_${define_name} e define variável
AC_ARG_WITH([${option}],
  AS_HELP_STRING([--with-${option}=@<:@DIR@:>@], [${description}]),
  [
    if test "x${DOLAR}with_${option}" != xno; then
      AC_DEFINE([WITH_${define_name}], [1], [Define se ${option} está habilitado])
      ${define_name}_PATH="${DOLAR}with_${option}"
      AC_SUBST([${define_name}_PATH])
    fi
  ])

dnl \`WITH_${define_name}' do Makefile.am.
AM_CONDITIONAL(WITH_${define_name}, [1])

EOF

echo "Adicione o bloco acima ao configure.ac!" >&2
