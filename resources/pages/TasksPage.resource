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
    
    ${element}        Set Variable    css=.task-done >> text=${task_name}

    # Caso tenha mais de uma task na lista vai usar .task-todo + texto cadastrado, não tendo problema de dados ubiquos.
    Wait For Elements State        ${element}        visible    5

    Get Style        ${element}        text-decoration-line     equal       line-through

Marca tarefa como concluida
    [Arguments]    	    ${task_name}

    ${element}       Set Variable        xpath=//strong[text()="${task_name}"]/..//button[@class="item-toggle"]
    
    Wait For Elements State    ${element}    visible    5

    Click    ${element}

Deletar tarefa indesejada    
    [Arguments]    ${task_name}

    ${element}       Set Variable        xpath=//strong[text()="${task_name}"]/..//button[@class="task-remove"]

    Wait For Elements State    ${element}        visible    5

    Click    ${element}

Valida tarefa inexistente
    [Arguments]        ${task_name}
    
    # Caso tenha mais de uma task na lista vai usar .task-todo + texto cadastrado, não tendo problema de dados ubiquos.
    Wait For Elements State    css=.task-todo >> text=${task_name}    detached    5