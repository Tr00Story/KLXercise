*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${URL} =    https://automationexercise.com
${HOME_IDENTIFYING_ELEM} =    id=slider-carousel


*** Keywords ***
Navigate to
    Go To    ${URL}

Verify page loaded
    Wait Until Page Contains Element    ${HOME_IDENTIFYING_ELEM}