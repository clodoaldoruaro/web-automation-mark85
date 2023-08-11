*** Settings ***
Documentation       Cenários de testes do cadastro de usuários

Resource    ../resources/base.resource
Resource    ../resources/pages/SignupPage.resource

Test Setup        Inicia sessao
Test Teardown     Take Screenshot


*** Test Case ***
Deve poder cadastrar novos usuários
    [Tags]    new_user

    ${user}        Create Dictionary
    ...            name=Clodoaldo Ruaro
    ...            email=clodoaldo@ruaro.com
    ...            password=pwd123
    
    #Remove o usuário do teste anterior
    Remove usuario DB              ${user}[email]

    Acessar pagina inscricao
    Enviar pagina inscricao      ${user}
    Mensagem notificacao        Boas vindas ao Mark85, o seu gerenciador de tarefas.

Não deve permitir cadastrar email duplicado
    [Tags]    dup

    ${user}        Create Dictionary
    ...            name=Ruaro Clodoaldo 
    ...            email=ruaro@clodoaldo.com
    ...            password=pwd123

    Remove usuario DB   ${user}[email]
    Inserir usuario DB    ${user}
    
    Acessar pagina inscricao
    Enviar pagina inscricao      ${user}
    Mensagem notificacao        Oops! Já existe uma conta com o e-mail informado.

Campos obrigatórios
    [Tags]    required

    ${user}        Create Dictionary
    ...            name=${EMPTY}
    ...            email=${EMPTY}
    ...            password=${EMPTY}
    
    Acessar pagina inscricao
    Enviar pagina inscricao    ${user}
    
    Alerta campo texto    Informe seu nome completo
    Alerta campo texto    Informe seu e-email
    Alerta campo texto    Informe uma senha com pelo menos 6 digitos

Não deve cadastrar com email incorreto
    [Tags]     inv_email

    ${user}        Create Dictionary
    ...            name=Charles Xavier
    ...            email=xavier.com.br
    ...            password=pwd123
    
    Acessar pagina inscricao
    Enviar pagina inscricao    ${user}

    Alerta campo texto    Digite um e-mail válido

Não deve cadastrar com senha menor que 6 digitos
    [Tags]    short_pass_fast
    
    @{password_list}        Create List     1    12    123    1234    12345

    FOR    ${password}    IN    @{password_list}

        ${user}        Create Dictionary
        ...            name=Charles Xavier
        ...            email=xavier@mail.com.br
        ...            password=${password}
        
        Acessar pagina inscricao
        Enviar pagina inscricao    ${user}

        Alerta campo texto    Informe uma senha com pelo menos 6 digitos
    END

Não deve cadastrar com senha de 1 digito
    [Tags]     short_pass
    [Template]
    Senha curta    1

Não deve cadastrar com senha de 2 digitos
    [Tags]     short_pass
    [Template]
    Senha curta    12

Não deve cadastrar com senha de 3 digitos
    [Tags]     short_pass
    [Template]
    Senha curta    123

Não deve cadastrar com senha de 4 digitos
    [Tags]     short_pass
    [Template]
    Senha curta    1234

Não deve cadastrar com senha de 5 digitos
    [Tags]     short_pass
    [Template]
    Senha curta    12345


*** Keywords ***
Senha curta
    [Arguments]     ${short_pass}   

    ${user}        Create Dictionary
    ...            name=Charles Xavier
    ...            email=xavier@mail.com.br
    ...            password=${short_pass}
    
    Acessar pagina inscricao
    Enviar pagina inscricao    ${user}

    Alerta campo texto    Informe uma senha com pelo menos 6 digitos