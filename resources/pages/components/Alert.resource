*** Settings ***
Documentation        Ações e elementos do componente de mensagens de alertas

Library        Browser

*** Keywords ***
Alerta campo texto
    [Arguments]        ${expected_text}
    
    # Aguarda até 5 segundos o alerta ser exibido na tela
    Wait For Elements State        css=.alert-error >> text=${expected_text}        visible    5