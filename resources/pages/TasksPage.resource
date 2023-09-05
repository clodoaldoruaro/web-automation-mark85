*** Settings ***
Documentation        Ações e elementos da página de listagem de tarefas

Library        Browser

*** Keywords ***
Valida tarefa cadastrada
    [Arguments]        ${task_name}
    
    # Caso tenha mais de uma task na lista vai usar .task-todo + texto cadastrado, não tendo problema de dados ubiquos.
    Wait For Elements State    css=.task-todo >> text=${task_name}    visible    5

Valida tarefa completa
    [Arguments]        ${task_name}
    
    # Armazena a task concluida + o nome na variavel element
    ${element}        Set Variable    css=.task-done >> text=${task_name}

    # Caso tenha mais de uma task na lista vai usar .task-todo + texto cadastrado, não tendo problema de dados ubiquos.
    Wait For Elements State        ${element}        visible    5

    # Valida se na classe do element (.task-done) o css text-decoration-line é igual a line-through (tarefa riscada)
    Get Style        ${element}        text-decoration-line     equal       line-through

Marca tarefa como concluida
    [Arguments]    	    ${task_name}

    # Armazena o cleckbox + o nome da task na variavel element
    ${element}       Set Variable        xpath=//strong[text()="${task_name}"]/..//button[@class="item-toggle"]
    
    # Aguarda o elemento ficar visivel e realiza o click
    Wait For Elements State    ${element}    visible    5
    Click    ${element}

Deletar tarefa indesejada    
    [Arguments]    ${task_name}

    # Armazena o botão lixeira + o nome da task na variavel element
    ${element}       Set Variable        xpath=//strong[text()="${task_name}"]/..//button[@class="task-remove"]
    
    # Aguarda o elemento ficar visivel e realiza o click
    Wait For Elements State    ${element}        visible    5
    Click    ${element}

Valida tarefa inexistente
    [Arguments]        ${task_name}
    
    # Aguarda se o elemento não existir na tela por 5 segundos utilizando css selector do robot
    Wait For Elements State    css=.task-todo >> text=${task_name}    detached    5