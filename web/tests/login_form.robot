***Settings***
Resource        base.robot
Test Setup      Nova sessão
Test Teardown   Encerra sessão

**Test Cases***
Login com sucesso
    Go To                                                               ${url}login
    Login With                                                          stark                                               jarvis!
    Should See Loged User                                               Tony Stark

Senha inválida
    [tags]                                                              login_error
    Go To                                                               ${url}login
    Login With                                                          stark                                               asd3 
    Should Contain Login Alert                                          Senha é invalida!

Usuário não existe
    [tags]                                                              login_user404
    Go To                                                               ${url}login
    Login With                                                          papito                                              testf3
    Should Contain Login Alert                                          O usuário informado não está cadastrado!


***Keywords***
Login With
    [Arguments]             ${uname}       ${pass}  

    Input Text              css:input[name=username]                ${uname}
    Input Text              css:input[name=password]                ${pass}
    Click Element           class:btn-login 

Should Contain Login Alert
    [Arguments]             ${expect_message}
    ${message}=             Get WebElement                         id:flash
    Should Contain          ${message.text}                        ${expect_message}

Should See Loged User
    [Arguments]             ${full_name}
    Page Should Contain     Olá, ${full_name}. Você acessou a área logada!