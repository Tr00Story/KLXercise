*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${USER_NAME_FIELD} =    //*[@id="form"]/div/div/div[1]/div/form/input[2]
# Normally this shouldn't be here, much less in clear, but for demo purposes it will have to do
${USER_NAME} =    TesterGuy@email.com
${PASSWORD_FIELD} =    //*[@id="form"]/div/div/div[1]/div/form/input[3]
# Normally this shouldn't be here, much less in clear, but for demo purposes it will have to do
${PASSWORD} =    KLXt3st
${LOGIN_BUTTON} =    //*[@id="form"]/div/div/div[1]/div/form/button


*** Keywords ***
Login
    Input Text    ${USER_NAME_FIELD}    ${USER_NAME}
    Input Password    ${PASSWORD_FIELD}    ${PASSWORD}
    Click Element    ${LOGIN_BUTTON}