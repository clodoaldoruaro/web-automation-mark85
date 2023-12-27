<h1 align="center">
  Automação de testes web
</h1>

App Mark85, permite o usuário gerenciar sua lista de tarefas ou de compras.

Veja as features que contemplam essa automação de testes no grupo "Features do projeto"

Projeto criado visando estudos em automação de testes web com robotframework, abordando alguns princípios de design de código importantes no desenvolvimento como por exemplo: código limpo, encapsulamento, tratamento de dados sensíveis e testes independentes.

## Tecnologias utilizadas

- [Python](https://www.python.org/)
- [Robotframework](https://robotframework.org/)
- [MongoDB](https://www.mongodb.com/pt-br)
- [VSCode](https://code.visualstudio.com/)


## Bibliotecas obrigatórias
```
pip install robotframework==6.1
pip install pymongo==4.4.1
pip install bcrypt==4.0.1
pip install Faker==19.1.0
pip install requests==2.22.0
pip install robotframework-browser==17.1.0
pip install robotframework-faker==5.0.0
pip install robotframework-jsonlibrary==0.5
pip install robotframework-requests==0.9.5
pip install robotframework-seleniumlibrary==6.1.0
```

## Features do projeto

Testes E2E
- Webapp deve estar online
- Deve poder logar com um usuário ja existente
- Nao deve logar com senha invalida
- Deve poder cadastrar novos usuários
- Não deve permitir cadastrar email duplicado
- Campos obrigatórios
- Não deve cadastrar com email incorreto
- Não deve cadastrar com senha menor que 6 digitos
- Deve poder cadastrar uma nova tarefa
- Não deve cadastrar tarefa com nome duplicado
- Não deve cadastrar tarefa com limite de tags
- Deve permiter apagar uma tarefa
- Deve permiter concluir uma tarefa

## Funcionalidades

- Tags
- XPath
- CSS Selector
- Page Objects
- Encapsulamento
- Dados sensíveis
- Setup e Teardown
- Camada de fixtures
- Consumindo API Rest
- Dados com lib Faker
- Testes independentes
- Validando comportamento esperado
- Lib Python para CRUD na base de dados