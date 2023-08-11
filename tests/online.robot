*** Settings ***
Documentation        Cenário de teste aplicação online

Resource    ../resources/base.resource

*** Test Cases ***
Webapp deve estar online

    Inicia sessao
    Get Title       equal       Mark85 by QAx