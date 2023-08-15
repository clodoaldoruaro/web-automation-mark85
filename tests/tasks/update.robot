*** Settings ***
Documentation        Cenarios de testes de atualização de tarefas

Resource        ../../resources/base.resource

Test Setup        Inicia sessao
Test Teardown     Take Screenshot

*** Test Cases ***
Deve permiter concluir uma tarefa
    [Tags]    done

    ${massa}    Get fixture    tasks    done

    Reset usuario DB     ${massa}[user]
    Criar tarefa API     ${massa}
    Fazer login          ${massa}

    Valida tarefa cadastrada       ${massa}[tasks][name]
    Marca tarefa como concluida    ${massa}[tasks][name]
    Valida tarefa completa         ${massa}[tasks][name]