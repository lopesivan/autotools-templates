#!/usr/bin/env bash

# Este script gera automaticamente um bloco M4 para ser inserido no configure.ac
# com suporte à opção --enable-<opcao> que ativa um #define no código C.

# Verifica se dois argumentos foram passados: nome da opção e descrição
if [[ $# -lt 2 ]]; then
    echo "Uso: $0 <nome_opcao> <descricao>"
    echo "Exemplo: $0 debug 'compilar com código de depuração'"
    echo "---"
    echo "$0 debug 'compilar com código de depuração'"
    echo "$0 featureX 'habilita a feature especial X'"
    exit 1
fi

# Primeiro argumento: nome da opção (ex: debug, featureX)
option="$1"

# Segundo argumento: descrição textual da opção
description="$2"

# Converte o nome da opção para letras maiúsculas (ex: debug -> DEBUG)
define_name=$(echo "$option" | tr '[:lower:]' '[:upper:]')

DOLAR='$'
# Gera o bloco M4 para o configure.ac com sintaxe correta usando if
cat <<EOF
dnl --enable-${option} => adiciona #define ${define_name} 1
AC_ARG_ENABLE([${option}],
  AS_HELP_STRING([--enable-${option}], [${description}]),
  [if test "x${DOLAR}enable_${option}" = xyes; then
     AC_DEFINE([${define_name}], [1], [Define para ${description}])
   fi])
EOF

echo
echo "Adicione o bloco acima ao configure.ac!" >&2

# Gera o bloco C para usar o #define no código-fonte
cat <<EOF

/*
 * #ifdef ${define_name}
 *   puts("Compilado com ${define_name}!");
 * #endif
 *
 * Adicione o bloco acima ao seu código C para ativar o comportamento opcional.
 */
EOF

echo "Adicione o bloco C para usar no código-fonte!" >&2
exit 0
