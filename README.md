Ótimo, que bom que está funcionando! Sobre sua dúvida: os **números da versão** em `-version-info` usados pelo `libtool` seguem um esquema específico chamado **libtool versioning**, que é **diferente** de versão semântica (tipo `1.2.3`).

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

