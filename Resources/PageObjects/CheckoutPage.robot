*** Settings ***
Library    SeleniumLibrary
Library    String


*** Variables ***
${CHECKOUT_IDENTIFYING_ELEM} =    id=cart_info
${CHECKOUT_TABLE_ELEM} =    //*[@id="cart_info"]/table
${PRICE_ROW} =    5


*** Keywords ***
Verify page loaded
    Wait Until Page Contains Element    ${CHECKOUT_IDENTIFYING_ELEM}

Validate if product is present
    [Arguments]    ${product}
    Element Should Contain    ${CHECKOUT_IDENTIFYING_ELEM}    ${product}    ignore_case=True

Validate total cost
    [Arguments]    ${cart_size}
    Set Local Variable    ${total_sum}    0
    # Remove the table header and add padding so the last item is checked
    ${cart_size} =    Evaluate    int(${cart_size}) + 2
    # Starts at 2 because that's the first item position in the table
    FOR    ${counter}    IN RANGE    2    ${cart_size}
        ${item_price_string} =    Get Table Cell    ${CHECKOUT_TABLE_ELEM}    ${counter}    ${PRICE_ROW}
        ${item_price_split} =    Fetch From Right    ${item_price_string}    ${SPACE}
        # Add price to total
        ${total_sum} =    Evaluate    int(${total_sum}) + int(${item_price_split})
    END
    # Get total cart cost
    # For some reason the last row of the table has 1 collumn less so we can't use the loop
    ${cart_price_row} =    Evaluate    int(${PRICE_ROW}) - 1
    ${price_total_string} =    Get Table Cell    ${CHECKOUT_TABLE_ELEM}    4    ${cart_price_row}
    ${price_total_split} =    Fetch From Right    ${price_total_string}    ${SPACE}
    # Check if values match
    Should Be Equal As Integers    ${total_sum}    ${price_total_split}