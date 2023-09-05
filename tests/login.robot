*** Settings ***
Documentation        Cenarios de autenticação do usuário

Library           Collections

Resource          ../resources/base.resource

Test Setup        Inicia sessao
Test Teardown     Take Screenshot

*** Test Cases ***
Deve poder logar com um usuário ja existente

    ${user}        Create Dictionary
    ...            name=Clodoaldo Ruaro
    ...            email=clodoaldo@ruaro.com
    ...            password=pwd123

    Remove usuario DB     ${user}[email]
    Inserir usuario DB    ${user}

    Realiza login                 ${user}
    Usuario deve estar logado     ${user}[name]

Nao deve logar com senha invalida

    ${user}        Create Dictionary
    ...            name=Steve Jobs
    ...            email=steve@jobs.com
    ...            password=pwd123

    Remove usuario DB     ${user}[email]
    Inserir usuario DB    ${user}

    Set To Dictionary     ${user}       password=123456

    Realiza login         ${user}
    Mensagem notificacao        Ocorreu um erro ao fazer login, verifique suas credenciais.