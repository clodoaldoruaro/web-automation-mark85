*** Settings ***
Documentation        Ações e elementos da página de cadastro de tarefas

Library        Browser

*** Keywords ***

Cadastra nova tarefa
    [Arguments]        ${task}

    ${tags_elemet}    Set Variable        css=input[name=tags]
    
    # Insere no campo de tags as tags do tasks.json usando parametro ${task}[name]
    Fill Text        css=input[placeholder="Nome da tarefa"]        ${task}[name]
    
    # For que insere a quantidade de tags que possui no tasks.json com o parametro de lista @{task}[name]
    # Cada loop do for digita uma tag e pressiona enter para esperar a próxima
    FOR    ${tag}    IN    @{task}[tags]
        Fill Text        ${tags_elemet}        ${tag}
        # Simula o delay do usuário inserindo as tags
        Sleep    0.5
        Press Keys       ${tags_elemet}        Enter
    END

    Click            css=button >> text=Cadastrar
