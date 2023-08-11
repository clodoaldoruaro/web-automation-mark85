*** Settings ***
Documentation        Elementos e ações da página de cadastro

Library         Browser
Resource        ../env.resource
Resource        components/Alert.resource

*** Keywords ***
Acessar pagina inscricao
    #Inicia Browser e acessa a página de cadastro
    Go To        ${BASE_URL}/signup

    ${element}        Set Variable         css=h1

    #Checkpoint
    Wait For Elements State        ${element}        visible        5
    Get Text                       ${element}        equal          Faça seu cadastro

Enviar pagina inscricao
    
    [Arguments]      ${user}

    #Preenchimento do formulário do cadastro
    Fill Text        id=name        ${user}[name]
    Fill Text        id=email       ${user}[email]
    Fill Text        id=password    ${user}[password]

    Click            id=buttonSignup

Senha curta
    [Arguments]     ${short_pass}   

        ${user}        Create Dictionary    
        ...    name=Charles Xavier    
        ...    email=xavier@mail.com.br     
        ...    password=${short_pass}
    
    Acessar pagina inscricao
    Enviar pagina inscricao    ${user}

    Alerta campo texto    Informe uma senha com pelo menos 6 digitos