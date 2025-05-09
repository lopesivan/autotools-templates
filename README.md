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

Quer que eu te mostre o que aconteceria se depois da 10ª modificação você fizesse uma mudança **compatível**, ou até uma **quebra de API**?
