Os **números da versão** em `-version-info` usados pelo
`libtool` seguem um esquema específico chamado **libtool
versioning**, que é **diferente** de versão semântica
(tipo `1.2.3`).

---

## 🧠 Estrutura de `-version-info`

O formato é:

```
-version-info CURRENT:REVISION:AGE
```

Exemplo que você usou:

```make
libminhalib_la_LDFLAGS = -version-info 0:0:0
```

---

## ✅ Regras para os valores

1. `CURRENT`: a versão da **API atual**.
2. `REVISION`: quantas vezes você mudou a **implementação**, mas manteve a API.
3. `AGE`: quantas versões **anteriores** da API essa versão **ainda suporta**.

### 🔴 Regra mais importante:

> **`AGE` não pode ser maior que `CURRENT`.**

---

## 📌 Exemplos válidos

| CURRENT | REVISION | AGE | Interpretação                                                    |
| ------- | -------- | --- | ---------------------------------------------------------------- |
| 0       | 0        | 0   | Primeira versão da lib.                                          |
| 1       | 0        | 0   | Primeira versão pública da API.                                  |
| 2       | 1        | 1   | Segunda versão da API, compatível com versão 1.                  |
| 5       | 2        | 3   | Quinta versão da API, compatível com APIs 2, 3, 4, 5.            |
| 3       | 4        | 0   | Terceira versão da API, **incompatível** com versões anteriores. |

---

## 🔥 Exemplos inválidos (o que **não** fazer)

| CURRENT | REVISION | AGE | Problema                                           |
| ------- | -------- | --- | -------------------------------------------------- |
| 2       | 0        | 3   | ❌ `AGE > CURRENT`                                  |
| 1       | 2        | 2   | ❌ `REVISION > 0` mas `CURRENT` nunca mudou         |
| 0       | 1        | 0   | ❌ `REVISION > 0` sem uma API versão (CURRENT) real |

---

## 🎯 Dica prática para você:

Se está no início do projeto:

```make
-version-info 1:0:0
```

Depois, se **mudar só a implementação**, mas a API não:

```make
-version-info 1:1:0
```

Se fizer uma **mudança compatível** na API:

```make
-version-info 2:0:1
```

Se quebrar a API:

```make
-version-info 3:0:0
```

---


Abaixo está uma tabela com **10 exemplos realistas** de
versões `-version-info CURRENT:REVISION:AGE`, começando de
`0:0:0`, seguindo uma possível evolução do seu projeto:

| Versão | CURRENT | REVISION | AGE | Situação na evolução                               |
| ------ | ------- | -------- | --- | -------------------------------------------------- |
| 1      | 0       | 0        | 0   | 🔹 Primeira versão da lib (ainda instável).        |
| 2      | 1       | 0        | 0   | ✅ Primeira API pública estável.                    |
| 3      | 1       | 1        | 0   | ✅ Otimizações internas, sem mudar a API.           |
| 4      | 2       | 0        | 1   | ✅ API expandida, mas ainda compatível com v1.      |
| 5      | 3       | 0        | 2   | ✅ Continua compatível com v1 e v2.                 |
| 6      | 4       | 0        | 0   | ⚠️ Quebrou compatibilidade com versões anteriores. |
| 7      | 4       | 1        | 0   | ✅ Refatoração interna, API igual.                  |
| 8      | 5       | 0        | 0   | ⚠️ Nova API, incompatível com anteriores.          |
| 9      | 6       | 0        | 1   | ✅ Compatível com API da versão 5.                  |
| 10     | 7       | 0        | 2   | ✅ Compatível com APIs 5, 6 e 7.                    |

---

### 📌 Lembre:

* A `AGE` indica quantas versões **anteriores da API** são compatíveis com a versão atual.
* `REVISION` só muda se você altera a **implementação**, mas **mantém a mesma API**.

---


Aqui está uma tabela com **dez modificações consecutivas**,
**mantendo a mesma versão de API (`CURRENT = 1`)**, ou seja,
**sem mudar a interface pública**, apenas com mudanças
internas, correções e otimizações. Essas mudanças
incrementam apenas o `REVISION`.

---

### 🔢 Versões com `CURRENT = 1`, `AGE = 0`

| Modificação | CURRENT | REVISION | AGE | O que mudou?                            |
| ----------- | ------- | -------- | --- | --------------------------------------- |
| 1           | 1       | 0        | 0   | Versão inicial estável da API.          |
| 2           | 1       | 1        | 0   | Corrigido bug em função interna.        |
| 3           | 1       | 2        | 0   | Otimização no algoritmo de busca.       |
| 4           | 1       | 3        | 0   | Melhor tratamento de erros.             |
| 5           | 1       | 4        | 0   | Refatoração interna sem impacto na API. |
| 6           | 1       | 5        | 0   | Adição de log interno (debug build).    |
| 7           | 1       | 6        | 0   | Correção de memory leak.                |
| 8           | 1       | 7        | 0   | Melhor compatibilidade com GCC.         |
| 9           | 1       | 8        | 0   | Melhoria em testes internos.            |
| 10          | 1       | 9        | 0   | Ajustes de performance e compilação.    |

---

### 🧠 Observações

* `AGE = 0`: a API **só é compatível com ela mesma** (sem retrocompatibilidade).
* `CURRENT` permanece `1`: significa que **a API pública é a mesma**.
* `REVISION` cresce a cada alteração interna sem afetar quem usa a biblioteca.

---


> Você quer:
>
> * `CURRENT = 10`
> * `REVISION = 200`
> * Compatível com: versões 9, 8, 7, 6

---

## ✅ Significado disso em `libtool` terms

| Campo      | Valor | Significado                                                                         |
| ---------- | ----- | ----------------------------------------------------------------------------------- |
| `CURRENT`  | 10    | Esta é a **décima versão da API**.                                                  |
| `REVISION` | 200   | Houve **200 alterações internas** desde a API 10 ser criada. Nenhuma quebrou a API. |
| `AGE`      | 4     | Esta versão ainda **suporta as APIs das versões 6, 7, 8 e 9**.                      |

> 🎯 **Regra:** se você quer compatibilidade com versões `CURRENT - AGE`, então:
>
> ```
> AGE = CURRENT - menor versão compatível
> AGE = 10 - 6 = 4
> ```

---

## ✅ Final:

```make
libminhalib_la_LDFLAGS = -version-info 10:200:4
```

### 🧠 Interpretação:

* A lib é da API 10.
* Ela teve 200 revisões internas desde que a API 10 foi introduzida.
* Ela **ainda é compatível com APIs 6, 7, 8 e 9**.

---

### ⚠️ Dica Importante:

Se você eventualmente **quebrar a compatibilidade com a API
9**, o próximo `AGE` deve ser `3` ou menos, e o `CURRENT`
aumentaria para `11`.

---

Abaixo está um **script simples em Shell** que você pode
usar para **gerenciar o versionamento Libtool** automaticamente
com base em regras como:

* Incrementar `REVISION` para alterações internas.
* Resetar `REVISION` e incrementar `CURRENT` se a API pública mudar.
* Reduzir `AGE` se quebrar compatibilidade com versões anteriores.

---

## ✅ `version.sh` – Script de controle de versionamento

```bash
#!/bin/bash
# Libtool version manager for libminhalib.la

VERSION_FILE=".libtool_version"

# Inicializar se não existir
if [ ! -f "$VERSION_FILE" ]; then
    echo "1 0 0" > "$VERSION_FILE"  # CURRENT REVISION AGE
fi

read CURRENT REVISION AGE < "$VERSION_FILE"

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
        echo "Opção inválida."
        exit 1
        ;;
esac

echo "$CURRENT $REVISION $AGE" > "$VERSION_FILE"

echo
echo "Nova versão Libtool:"
echo "  -version-info $CURRENT:$REVISION:$AGE"
echo
echo "Adicione essa linha ao seu Makefile.am:"
echo "libminhalib_la_LDFLAGS = -version-info $CURRENT:$REVISION:$AGE"
```

---

## 💾 Como usar

1. Salve o script como `version.sh`.
2. Torne-o executável:

```bash
chmod +x version.sh
```

3. Rode sempre que fizer mudanças:

```bash
./version.sh
```

Ele te guiará com perguntas e gerará o `-version-info` correto.

---

### ⚡ Extra (opcional):

Você pode adicionar o `-version-info` automaticamente no
`Makefile.am` com `sed`, se quiser automatizar ainda mais.

Abaixo está a versão **atualizada do script `version.sh`**, que:

1. Atualiza os números de versão (`CURRENT`, `REVISION`, `AGE`) com base na sua escolha.
2. **Insere ou atualiza automaticamente** a linha `libminhalib_la_LDFLAGS = -version-info ...` no seu `Makefile.am`.

---

## ✅ Script `version.sh` (com atualização automática do Makefile.am)

```bash
#!/bin/bash
# Libtool version manager for libminhalib.la

VERSION_FILE=".libtool_version"
MAKEFILE_AM="Makefile.am"

# Inicializar versão se não existir
if [ ! -f "$VERSION_FILE" ]; then
    echo "1 0 0" > "$VERSION_FILE"  # CURRENT REVISION AGE
fi

# Ler versão atual
read CURRENT REVISION AGE < "$VERSION_FILE"

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
echo "$CURRENT $REVISION $AGE" > "$VERSION_FILE"

# Atualizar ou adicionar linha no Makefile.am
LDFLAGS_LINE="libminhalib_la_LDFLAGS = -version-info $CURRENT:$REVISION:$AGE -no-undefined"

if grep -q "^libminhalib_la_LDFLAGS" "$MAKEFILE_AM"; then
    sed -i "s/^libminhalib_la_LDFLAGS.*/$LDFLAGS_LINE/" "$MAKEFILE_AM"
else
    echo "$LDFLAGS_LINE" >> "$MAKEFILE_AM"
fi

# Mostrar resultado
echo
echo "✅ Nova versão Libtool:"
echo "  -version-info $CURRENT:$REVISION:$AGE"
echo "📄 Makefile.am atualizado com:"
echo "  $LDFLAGS_LINE"
```

---

## 🧪 Exemplo de uso

```bash
./version.sh
```

Saída esperada:

```
Versão atual: CURRENT=1, REVISION=0, AGE=0

Selecione a mudança:
1) Mudança interna (não afeta API)
2) Expansão compatível da API (ex: nova função pública)
3) Quebra de compatibilidade (API incompatível)
Sua escolha (1/2/3): 2

✅ Nova versão Libtool:
  -version-info 2:0:1
📄 Makefile.am atualizado com:
  libminhalib_la_LDFLAGS = -version-info 2:0:1 -no-undefined
```

---

Quer que o script também rode `autogen.sh` e `make` automaticamente depois da atualização?
