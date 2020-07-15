# Be The Hero Flutter

Projeto Be The Hero criado pela Rockseat desenvolvido agora utilizando Flutter e Hasura.

Aplicação dividida em projeto frontend utilizando flutter web e frontend mobile com flutter.

---

## Frontend Web

[Be The Hero](https://betheheroflutter.netlify.app/#/)

## Frontend Mobile

Apk versão arm64

[BeTheHero-arm64.apk](https://drive.google.com/file/d/19dhmgbmF9e700_lo51oJG6pWJbF3hHrx/view?usp=sharing)

Apk versão arm

[BeTheHero-arm.apk](https://drive.google.com/file/d/1wssunRBVg7aYkQbErUdKNZz0U2atYvBq/view?usp=sharing)

## Construção

### Tipografia/Fontes

- Roboto

### Paleta de cores

- Background color (#F0F0F5)
- red color (#E02041)

### Tecnologias a serem utilizadas

- Injeção de dependências
    - Modular
- Gerência de estado
    - Mobx
    - SetState
- Banco de dados
    - Postgress SQL
- Dados locais
    - SharedPreferences
- Geração de arquivos CLI
    - Slidy
- Beckend
    - Hasura com GraphQL

### CI/CD e Testes automatizados

- [x]  Github Actions
    - Pull request para as branches master e developer
- Fazer testes locais
- [x]  Seguir o Gitflow
    - Branch master para versão estável
    - Branch Developer para desenvolvimento
    - Criar branch para cada feature
        - Ex: "feature/login"
    - Fazer Merge e excluir a branch quando concluída

### Models / Entidades da Aplicação

- ONG
    - id
    - name
    - email
    - whatsapp
    - city
    - uf
- Incidents (Casos)
    - title
    - description
    - value
    - ong_id
    - ONG dados

### Funcionalidades da aplicação web

- [x]  Login de ONG
- [x]  Logout de ONG
- [x]  Cadastro de ONG
- [x]  Cadastrar novos casos
- [x]  Deletar casos
- [x]  Listar casos específicos de uma ONG

 

---

### Funcionalidades da aplicação mobile

- [x]  Listar todos os casos das ONGS
- [x]  Entrar em contato com a ONG
    - [x]  Via whatsapp
    - [x]  Via email

---

### Minhas Queries em GraphQL

- Cadastrar uma nova ONG ✅

```graphql
mutation createOng($id:String!, $name: String!, $email: String!, $whatsapp: String!, $city: String!, $uf: String!) {
  insert_ongs(objects: {id: $id, name: $name, email: $email, whatsapp: $whatsapp, city: $city, uf: $uf}) {
    affected_rows
    returning {
      id
    }
  }
}

**Variables:**
{
  "id": "abc123",
  "name": "APIPA",
  "email": "contato.apipa@gmail.com",
  "whatapp": "995327491",
  "city": "Piauí",
  "uf": "PI"
}

**Output:**
{
  "data": {
    "insert_ongs": {
      "affected_rows": 1,
      "returning": [
        {
          "id": "abc123"
        }
      ]
    }
  }
}

**OBS: id deve ser gerado na aplicação e enviado como uma variável**
```

- Cadastrar Incidents (Casos) ✅

```graphql
mutation createIncident($title: String!, $description: String!, $value: Float, $ong_id: String!) {
  insert_incidents(objects: {title: $title, description: $description, value: $value, ong_id: $ong_id}) {
    affected_rows
    returning {
      id
    }
  }
}

**Variables:**
{
  "title": "Caso 1",
  "description": "Detalhes do Caso",
  "value": 120,
  "ong_id": "abc123"
}

**Output:**
{
  "data": {
    "insert_incidents": {
      "affected_rows": 1,
      "returning": [
        {
          "id": 1
        }
      ]
    }
  }
}
```

- Listar todos os Incidents (Casos) ✅

```graphql
Tras os casos e os dados da ONG que esse caso pertence

query ListAllIncidents {
  incidents {
    id
    title
    description
    value
    ong_id
    ong {
      name
      email
      whatsapp
      city
      uf
    }
  }
}

**Output:**
{
  "data": {
    "incidents": [
      {
        "id": 2,
        "title": "Caso 2",
        "description": "Detalhes do Caso",
        "value": 120,
        "ong_id": "abc123",
        "ong": {
          "name": "APIPA",
          "email": "contato.apipa@gmail.com",
          "whatsapp": "995327491",
          "city": "Piauí",
          "uf": "PI"
        }
      }
    ]
  }
}

```

- Deletar um Incident de uma ONG ✅

```graphql
**Verificar se o caso que vai ser deletado pertence a ONG logada**

query verifyIncidentOng($idIncident: Int) {
  incidents(where: {id: {_eq: $idIncident}}) {
    ong_id
  }
}

**Variables:**
{
"idIncident": 1
}

**Output:**
{
  "data": {
    "incidents": [
      {
        "ong_id": "abc123"
      }
    ]
  }
}

**query trás a ONG dona do caso

OBS:** **se o id da ONG logada for diferente do id da ong dona do caso (ong_id) não pode deletar o caso**

mutation deleteIncident($id:Int!) {
  delete_incidents(where: {id: {_eq: $id}}) {
    affected_rows
  }
}

**Variables:**
{
"id": 1
}

```

- Listar casos específicos de uma ONG ✅

```graphql
**Acessar os dados da ONG logada**

**Buscar todos os incidents(casos) da ONG logada**

query getOngIncidents($ongID:String!) {
  incidents(where: {ong_id: {_eq: $ongID}}) {
    id
    title
    description
    value
    ong_id
  }
}

**Variables:**
{
  "ongID": "abc123"
}

**Output:**
{
  "data": {
    "incidents": [
      {
        "id": 2,
        "title": "Caso 2",
        "description": "Detalhes do Caso",
        "value": 120,
        "ong_id": "abc123"
      }
    ]
  }
}

```

- Login da ONG ✅

```graphql
**OBS: Login significa verificar se existe essa ong dentro do banco de dados**

query OngLogin($ongID: String!) {
  ongs(where: {id: {_eq: $ongID}}) {
    name
  }
}

**Variables:**
{
  "ongID": "abc123"
}

**Output:**
{
  "data": {
    "ongs": [
      {
        "name": "APIPA"
      }
    ]
  }
}
```

- Logout ✅
    - No frontend enviar o usuário para tela de login novamente