*** Settings ***
Documentation        Consuminto API do sistema

Library        RequestsLibrary

*** Keywords ***

POST login usuario
    [Arguments]        ${user}

    ${payload}        Create Dictionary         
    ...               email=${user}[email]
    ...               password=${user}[password]

    ${response}     POST    url=http://localhost:3333/sessions        
    ...             json=${payload}        
    ...             expected_status=200

    ${token}        Set Variable        ${response.json()}[token]

    Set Test Variable        ${token}

POST nova tarefa
    [Arguments]        ${payload}

    ${headers}        Create Dictionary
    ...               Authorization=${token}

    POST    url=http://localhost:3333/tasks
    ...    json=${payload}
    ...    headers=${headers}
    ...    expected_status=201
