*** Settings ***
Documentation        Cenarios de testes de atualização de tarefas

Resource        ../../resources/base.resource

Test Setup        Inicia sessao
Test Teardown     Take Screenshot

*** Test Cases ***
Deve permiter concluir uma tarefa
    [Tags]    done

    ${massa}    Get fixture    tasks    done

    Limpa usuario DB        ${massa}[user][email]
    Inserir usuario DB      ${massa}[user]

    POST login usuario      ${massa}[user]
    POST nova tarefa        ${massa}[tasks]

    Realiza login                ${massa}[user]
    Usuario deve estar logado    ${massa}[user][name]

    Valida tarefa cadastrada       ${massa}[tasks][name]
    Marca tarefa como concluida    ${massa}[tasks][name]
    Valida tarefa completa         ${massa}[tasks][name]