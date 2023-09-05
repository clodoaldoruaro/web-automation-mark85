*** Settings ***
Documentation        Cenário de teste aplicação online

Resource    ../resources/base.resource

*** Test Cases ***
Webapp deve estar online

    # Inicia o browser e valida se o titulo da página é igual a Mark85 by QAx
    Inicia sessao
    Get Title       equal       Mark85 by QAx