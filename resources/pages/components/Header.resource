*** Settings ***
Documentation        Ações e elementos do cabeçalho do mark85

Library        Browser
Library        String

*** Keywords ***

# Valida se o usuário esta logado
Usuario deve estar logado
    [Arguments]        ${name}

    # Cria uma lista com nome e sobrenome do usuário para poder pegar apenas o primeiro nome
    @{first_name}     Split String        ${name}
    ${element}        Set Variable        css=header .right small 

    # Valida se o nome na posição 0 (primeiro nome) esta igual ao elemento exibido na tela
    Wait For Elements State    ${element}        visible        5
    Get Text                   ${element}        equal          Olá, ${first_name}[0]

# Aguarda o botão nova tarefa e realiza o clique
Clica botao nova tarefa
    
    # Armazena o botão na variável element usando css selector
    ${element}        Set Variable        css=.button-add

    # Aguarda botão element ficar visivel e realiza o click
    Wait For Elements State    ${element}
    Click        ${element}