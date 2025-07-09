# -*- Autoconf -*-
# Este arquivo deve ser processado com o autoconf para gerar o script
# 'configure'.
AC_INIT([hello], [0.02], [ivan@42algoritmos.com.br],
        [hello], [http://42algoritmos.com.br/])

# Garante que o autoconf seja pelo menos da versão 2.68
AC_PREREQ([2.68])

# Verificação de segurança — indica um arquivo fonte que deve estar no
# diretório correto
AC_CONFIG_SRCDIR([about.c])

# Gera um arquivo de cabeçalho com as configurações detectadas (config.h)
AC_CONFIG_HEADERS([config.h])

# Coloca arquivos auxiliares do autotools em um subdiretório para não poluir o
# diretório raiz
AC_CONFIG_AUX_DIR([build-aux])

# Define onde os arquivos de macros m4 personalizados estão localizados
AC_CONFIG_MACRO_DIR([m4])

# Inicializa o Automake e define opções: versão mínima, ativa avisos e
# trata-os como erros
AM_INIT_AUTOMAKE([1.11 -Wall -Werror])

# === Verificações de programas ===
# Verifica se há um compilador C disponível
AC_PROG_CC

# Verifica se há suporte ao utilitário 'ar' usado para criar bibliotecas
# estáticas
AM_PROG_AR

# Verifica se o compilador suporta a opção -c -o simultaneamente
AM_PROG_CC_C_O

# === Uso de bibliotecas ===
# Verifica o utilitário ranlib para indexação de bibliotecas estáticas
AC_PROG_RANLIB

# === Verificações de bibliotecas ===
# (Aqui você pode adicionar verificações como AC_CHECK_LIB para bibliotecas
# externas)

# === Verificações de arquivos de cabeçalho ===
# Verifica se o cabeçalho stdlib.h está disponível
AC_CHECK_HEADERS([stdlib.h])

# === Verificações de tipos, estruturas e características do compilador ===
# (Pode-se incluir AC_TYPE_* ou outras macros para garantir compatibilidade de
# tipos)

# === Verificações de funções ===
# (Pode-se usar AC_CHECK_FUNCS para garantir que certas funções estejam
# disponíveis)

# === Arquivos Makefile a serem gerados ===
AC_CONFIG_FILES([
    Makefile
    source/Makefile
    examples/list/Makefile
    examples/tree/Makefile
    examples/dynarrays/Makefile
    examples/gdb/01/Makefile
    examples/models/pythagoras/Makefile
    examples/models/eq2/Makefile
    examples/models/eq3/Makefile
    examples/models/eq4/Makefile
    examples/models/tree/Makefile
    examples/models/Sturm/Makefile
])

# Finaliza a configuração e gera os arquivos definidos
AC_OUTPUT

# Exibe uma mensagem com informações da configuração após o configure ser
# executado
AC_MSG_RESULT(
[
--------------------------------------------------
 ${PACKAGE_NAME} Versão ${PACKAGE_VERSION}

 Prefixo de instalação: '${prefix}'.
 Compilador: '${CC} ${CFLAGS}'
 Bibliotecas: '${LIBS}'

 Recursos do pacote:
   Execução assíncrona: ${async_exec}

 Agora digite 'make <alvo>'
   onde o <alvo> opcional pode ser:
     all                - compilar todos os binários
     install            - instalar tudo

--------------------------------------------------])

