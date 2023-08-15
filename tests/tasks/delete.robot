*** Settings ***
Documentation        Cenarios de testes de remoção de tarefas

Resource        ../../resources/base.resource

Test Setup        Inicia sessao
Test Teardown     Take Screenshot

*** Test Cases ***
Deve permiter apagar uma tarefa
    [Tags]    delete

    ${massa}    Get fixture    tasks    delete

    Reset usuario DB     ${massa}[user]
    Criar tarefa API     ${massa}
    Fazer login          ${massa}

    Deletar tarefa indesejada      ${massa}[tasks][name]
    Valida tarefa inexistente      ${massa}[tasks][name]