*** Settings ***
Documentation    Arquivo base

Library         JSONLibrary
Library         libs/database.py
Library         Browser

Resource        env.resource
Resource        services.resource

Resource        pages/LoginPage.resource
Resource        pages/SignupPage.resource
Resource        pages/TaskCreatePage.resource
Resource        pages/TasksPage.resource

Resource        pages/components/Header.resource
Resource        pages/components/Notice.resource
Resource        pages/components/Alert.resource

*** Keywords ***
#Inicia o navegador na home page com modo visual desativado
Inicia sessao

    New Browser     browser=${BROWSER}        headless=off
    New Page        ${BASE_URL}

# Recupera dados de arquivo json
Get fixture
    [Arguments]    ${nome_arquivo}      ${cenario}

    ${massa}    Load Json From File     ${EXECDIR}/resources/fixtures/${nome_arquivo}.json        encoding=utf-8

    [Return]    ${massa}[${cenario}]

# Remove usuário da base e tasks relacionadas e recria 
Reset usuario DB
     [Arguments]    ${massa}

    Limpa usuario DB        ${massa}[email]
    Inserir usuario DB      ${massa}

# Cria uma nova tarefa via API
Criar tarefa API
    [Arguments]    	${massa}
    
    POST login usuario      ${massa}[user]
    POST nova tarefa        ${massa}[tasks]

# Realiza login na applicação e valida se esta logado
Fazer login
    [Arguments]     ${massa}

    Realiza login                ${massa}[user]
    Usuario deve estar logado    ${massa}[user][name]