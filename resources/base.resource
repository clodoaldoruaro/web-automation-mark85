*** Settings ***

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
#Inicia o navegador na home page
Inicia sessao

    New Browser     browser=chromium        headless=off
    New Page        ${BASE_URL}

Get fixture
    [Arguments]    ${nome_arquivo}        ${cenario}

    ${massa}    Load Json From File         ${EXECDIR}/resources/fixtures/${nome_arquivo}.json        encoding=utf-8

    [Return]    ${massa}[${cenario}]