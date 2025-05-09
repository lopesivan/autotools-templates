#!/usr/bin/env bash

# Libtool version manager for libminhalib.la

VERSION_FILE=".libtool_version"
MAKEFILE_AM="Makefile.am"

# Inicializar versão se não existir
if [ ! -f "$VERSION_FILE" ]; then
    echo "1 0 0" >"$VERSION_FILE" # CURRENT REVISION AGE
fi

# Ler versão atual
read CURRENT REVISION AGE <"$VERSION_FILE"

echo "Versão atual: CURRENT=$CURRENT, REVISION=$REVISION, AGE=$AGE"
echo

echo "Selecione a mudança:"
echo "1) Mudança interna (não afeta API)"
echo "2) Expansão compatível da API (ex: nova função pública)"
echo "3) Quebra de compatibilidade (API incompatível)"
read -p "Sua escolha (1/2/3): " CHOICE

case $CHOICE in
1)
    REVISION=$((REVISION + 1))
    ;;
2)
    CURRENT=$((CURRENT + 1))
    REVISION=0
    AGE=$((AGE + 1))
    ;;
3)
    CURRENT=$((CURRENT + 1))
    REVISION=0
    AGE=0
    ;;
*)
    echo "❌ Opção inválida."
    exit 1
    ;;
esac

# Salvar nova versão
echo "$CURRENT $REVISION $AGE" >"$VERSION_FILE"

# Atualizar ou adicionar linha no Makefile.am
LDFLAGS_LINE="libminhalib_la_LDFLAGS = -version-info $CURRENT:$REVISION:$AGE -no-undefined"

if grep -q "^libminhalib_la_LDFLAGS" "$MAKEFILE_AM"; then
    sed -i "s/^libminhalib_la_LDFLAGS.*/$LDFLAGS_LINE/" "$MAKEFILE_AM"
else
    echo "$LDFLAGS_LINE" >>"$MAKEFILE_AM"
fi

# Mostrar resultado
echo
echo "✅ Nova versão Libtool:"
echo "  -version-info $CURRENT:$REVISION:$AGE"
echo "📄 Makefile.am atualizado com:"
echo "  $LDFLAGS_LINE"

exit 0
