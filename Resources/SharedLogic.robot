*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${BROWSER} =    edge
${SELENIUM_SPEED} =    0.5 seconds


*** Keywords ***
Start Web Test Suite
    Open Browser    about:blank    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${SELENIUM_SPEED}

End Web Test Suite
    Close Browser