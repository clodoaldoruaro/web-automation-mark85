*** Settings ***
Documentation        Ações e elementos do componente de notificação

Library        Browser

*** Keywords ***
Mensagem notificacao
    [Arguments]        ${text}

    ${element}         Set Variable        css=.notice p
    
     # Aguarda até 5 segundos a msg de notificação ser exibida na tela e valida se é igual ao text 
    Wait For Elements State     ${element}        visible        5
    Get Text                    ${element}        equal    	    ${text}