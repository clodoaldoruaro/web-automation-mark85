*** Settings ***
Documentation        Ações e elementos da página de login

Library         Browser

*** Keywords ***

# Realiza login na aplicação com usuário e senha
Realiza login
    [Arguments]        ${user}

    # Insere os dados nos campos do login
    Fill Text        css=input[placeholder$=mail]        ${user}[email]
    Fill Text        css=input[placeholder=Senha]        ${user}[password]

    # Realiza o click no botão entrar usando css selector do robot
    Click            css=button >> text=Entrar