*** Settings ***
Library    SeleniumLibrary


*** Variables ***
${PRODUCTS_BUTTON} =    //*[@id="header"]/div/div/div/div[2]/div/ul/li[2]/a
${CART_BUTTON} =    //*[@id="header"]/div/div/div/div[2]/div/ul/li[3]/a
${AD_ELEM} =    //*[@id="aswift_5_host"]
${DODGE_AD_ELEM} =    //*[@id="header"]/div/div/div/div[1]/div


*** Keywords ***
Press "Products" tab
    Click Element    ${PRODUCTS_BUTTON}
    # This sleep is only necessary because edge (unlike chrome) wasn't loading the popup fast enough
    Sleep    200ms
    Ignore Ads

Press "Cart" tab
    Click Element    ${CART_BUTTON}

Ignore Ads
    # If popup ad appeared, close it
    ${ad_is_present}    Run Keyword And Return Status    Page Should Contain Element    ${AD_ELEM}
    IF     ${ad_is_present}
        # Click out of the popup to close it
        Click Element At Coordinates    ${DODGE_AD_ELEM}    0    0
    END