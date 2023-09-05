*** Settings ***
Documentation        Consuminto API do sistema

Library        RequestsLibrary

*** Keywords ***

# Autenticação para poder manipular dados via API
POST login usuario
    [Arguments]        ${user}
    
    # Dicionario utilizado para usar apenas email e password do user, ainda tem name.
    ${payload}        Create Dictionary         
    ...               email=${user}[email]
    ...               password=${user}[password]

    # Realiza o POST na url para poder realizar a autenticação antes do POST nova tarefa
    ${response}     POST    url=http://localhost:3333/sessions        
    ...             json=${payload}        
    ...             expected_status=200

    # Armazena o token de autenticação
    ${token}        Set Variable        ${response.json()}[token]

    # Seta a variavel token para todo o escopo do teste atual.
    Set Test Variable        ${token}

# Cria uma nova tarefa via API
POST nova tarefa
    [Arguments]        ${payload}

    # Dicionario que armazena o token de autenticação recuperado no Set Test Variable 
    ${headers}        Create Dictionary
    ...               Authorization=${token}

    # POST que inclui uma nova tarefa via API
    POST    url=http://localhost:3333/tasks
    ...    json=${payload}
    ...    headers=${headers}
    ...    expected_status=201