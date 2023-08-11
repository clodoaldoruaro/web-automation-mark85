*** Settings ***
Documentation        Ações e elementos do cabeçalho do mark85

Library        Browser
Library        String

*** Keywords ***
Usuario deve estar logado
    [Arguments]        ${name}

    @{first_name}     Split String        ${name}
    ${element}        Set Variable        css=header .right small 

    Wait For Elements State    ${element}        visible        5
    Get Text                   ${element}        equal          Olá, ${first_name}[0]

Clica botao nova tarefa
    
    ${element}        Set Variable        css=.button-add

    Wait For Elements State    ${element}
    Click        ${element}