*** Settings ***
Library    SeleniumLibrary
Library    String


*** Variables ***
${PRODUCTS_IDENTIFYING_ELEM} =    id=search_product
${SEARCH_BUTTON} =    id=submit_search
${SEARCHED_IDENTIFYING_TEXT} =    searched products
${SEARCHED_LABEL_ELEM} =    xpath=/html/body/section[2]/div/div/div[2]/div/h2
${SEARCHED_PRODUCT_NAME_ELEM} =     xpath=/html/body/section[2]/div/div/div[2]/div/div[2]/div/div[1]/div[1]/p
${HOVER_CART_BUTTON} =    xpath=/html/body/section[2]/div/div/div[2]/div/div[2]/div/div[1]/div[1]/a
${ADD_TO_CART_BUTTON} =    xpath=/html/body/section[2]/div/div/div[2]/div/div[2]/div/div[1]/div[2]/div/a
${CONTINUE_SHOPPING_BUTTON} =    //*[@id="cartModal"]/div/div/div[3]/button


*** Keywords ***
Verify page loaded
    Wait Until Page Contains Element    ${PRODUCTS_IDENTIFYING_ELEM}

Search for product
    [Arguments]    ${search_term}
    Input Text    ${PRODUCTS_IDENTIFYING_ELEM}    ${search_term}
    Click Button    ${SEARCH_BUTTON}

Verify search success
    [Arguments]    ${search_term}
    Wait Until Page Contains Element    ${SEARCHED_LABEL_ELEM}
    # The text renders in upper case, but that's not what we get here so we need to equalize things
    # Why? Because the library keywords (for this) don't provide us with a way to ignore case
    ${label_text} =    Get Text    ${SEARCHED_LABEL_ELEM}
    # Convert both strings to lower case
    ${lowercase_label_text} =    Convert To Lower Case    ${label_text}
    ${lowercase_input_text} =    Convert To Lower Case    ${SEARCHED_IDENTIFYING_TEXT}
    Should Be Equal As Strings    ${lowercase_label_text}    ${lowercase_input_text}

Add to cart
    # Hover over the product will trigger the overlay that actually has the clickable element
    Mouse Over    ${HOVER_CART_BUTTON}
    Click Element    ${ADD_TO_CART_BUTTON}
    # Click continue shopping in case we want to add more products
    Click Element    ${CONTINUE_SHOPPING_BUTTON}