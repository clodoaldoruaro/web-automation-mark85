*** Settings ***
Documentation        Ações e elementos da página de cadastro de tarefas

Library        Browser

*** Keywords ***

Cadastra nova tarefa
    [Arguments]        ${task}

    ${tags_elemet}    Set Variable        css=input[name=tags]

    Fill Text        css=input[placeholder="Nome da tarefa"]        ${task}[name]
        
    FOR    ${tag}    IN    @{task}[tags]
        Fill Text        ${tags_elemet}        ${tag}
        # Simula o delay para o usuário inserir as tags
        Sleep    0.5
        Press Keys       ${tags_elemet}        Enter
    END

    Click            css=button >> text=Cadastrar
