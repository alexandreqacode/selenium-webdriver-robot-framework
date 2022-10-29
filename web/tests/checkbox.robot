***Settings***
Resource        base.robot
Test Setup      Nova sessão
Test Teardown   Encerra sessão

***Variables***
${check_thor}       id:thor
${check_ironman}    css:input[value='iron-man']
${check_panter}     xpath://*[@id='checkboxes']/input[7]


***Test Cases***
Marcando Opção com ID
    Go To                           ${url}checkboxes
    Select Checkbox                 ${check_thor}
    Checkbox Should Be Selected     ${check_thor}

Marcando Oção com CSS Selector
    Go To                           ${url}checkboxes
    Select Checkbox                 ${check_ironman}
    Checkbox Should Be Selected     ${check_ironman}

Marcando Opção com Xpath
    [tags]                          ironman
    Go To                           ${url}checkboxes
    Select Checkbox                 ${check_panter}
    Checkbox Should Be Selected     ${check_panter}
    Sleep                           3

