*** Settings ***
Documentation        Cenários de cadastros de tarefas

Resource        ../../resources/base.resource

Test Setup        Inicia sessao
Test Teardown     Take Screenshot

*** Test Cases ***
Deve poder cadastrar uma nova tarefa
    
    ${massa}    Get fixture    tasks    create

    Limpa usuario DB        ${massa}[user][email]
    Inserir usuario DB      ${massa}[user]

    Realiza login           ${massa}[user]

    Clica botao nova tarefa
    Cadastra nova tarefa        ${massa}[tasks]
    Valida tarefa cadastrada    ${massa}[tasks][name]

Não deve cadastrar tarefa com nome duplicado
    [Tags]    tag

    ${massa}    Get fixture    tasks    duplicate

    Limpa usuario DB        ${massa}[user][email]
    Inserir usuario DB      ${massa}[user]

    POST login usuario      ${massa}[user]
    POST nova tarefa        ${massa}[tasks]

    Realiza login           ${massa}[user]

    Clica botao nova tarefa
    Cadastra nova tarefa    ${massa}[tasks]

    Mensagem notificacao    Oops! Tarefa duplicada.

Não deve cadastrar tarefa com limite de tags
    [Tags]    tags_limit

    ${massa}    Get fixture    tasks    tags_limit

    Limpa usuario DB        ${massa}[user][email]
    Inserir usuario DB      ${massa}[user]

    Realiza login           ${massa}[user]

    Clica botao nova tarefa
    Cadastra nova tarefa    ${massa}[tasks]

    Mensagem notificacao    Oops! Limite de tags atingido.
