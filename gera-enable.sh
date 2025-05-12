#!/usr/bin/env bash

# Verifica os argumentos
if [[ $# -lt 2 ]]; then
    echo "Uso: $0 <nome_opção> <descrição>"
    echo "Exemplo: $0 debug 'compilar com código de depuração'"
    echo ---
    echo "$0 debug 'compilar com código de depuração'"
    echo "$0 featureX 'habilita a feature especial X'"
    exit 1
fi

option="$1"
description="$2"
define_name=$(echo "$option" | tr '[:lower:]' '[:upper:]') # Converte para maiúsculas

# Gera o bloco para o configure.ac
cat <<EOF
dnl --enable-${option} => adiciona #define ${define_name} 1
AC_ARG_ENABLE([${option}],
  AS_HELP_STRING([--enable-${option}], [${description}]),
  [test "x\\\$enable_${option}" = xyes && AC_DEFINE([${define_name}], [1],
               [Define para ${description}])])

EOF

echo "Adicione o bloco acima ao seu configure.ac!"

cat <<EOF
/*
 * #ifdef $define_name
 *   puts("Compilado com $define_name!");
 * #endif
 *
 * Adicione o bloco acima ao seu C source.
 */
EOF

exit 0
