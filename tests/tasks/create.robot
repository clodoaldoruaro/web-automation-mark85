*** Settings ***
Documentation        Cenários de cadastros de tarefas

Resource        ../../resources/base.resource

Test Setup        Inicia sessao
Test Teardown     Take Screenshot

*** Test Cases ***
Deve poder cadastrar uma nova tarefa
    [Tags]    critico
    
    ${massa}    Get fixture    tasks    create

    Reset usuario DB     ${massa}[user]
    Fazer login          ${massa}

    Clica botao nova tarefa
    Cadastra nova tarefa        ${massa}[tasks]
    Valida tarefa cadastrada    ${massa}[tasks][name]

Não deve cadastrar tarefa com nome duplicado
    [Tags]    tag

    ${massa}    Get fixture    tasks    duplicate

    Reset usuario DB     ${massa}[user]
    Criar tarefa API     ${massa}
    Fazer login          ${massa}

    Clica botao nova tarefa
    Cadastra nova tarefa    ${massa}[tasks]

    Mensagem notificacao    Oops! Tarefa duplicada.

Não deve cadastrar tarefa com limite de tags
    [Tags]    tags_limit

    ${massa}    Get fixture    tasks    tags_limit

    Reset usuario DB     ${massa}[user]
    Fazer login          ${massa}

    Clica botao nova tarefa
    Cadastra nova tarefa    ${massa}[tasks]
    Mensagem notificacao    Oops! Limite de tags atingido.
