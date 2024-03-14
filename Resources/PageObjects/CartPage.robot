*** Settings ***
Resource    ./LoginPage.robot
Resource    ./TopNav.robot


*** Variables ***
${CART_IDENTIFYING_ELEM} =    id=cart_items
${CHECKOUT_BUTTON} =    //*[@id="do_action"]/div[1]/div/div/a
${CHECKOUT_MODAL_ELEM} =    id=checkoutModal
${MODAL_LOGIN_BUTTON} =    //*[@id="checkoutModal"]/div/div/div[2]/p[2]/a


*** Keywords ***
Verify page loaded
    Wait Until Page Contains Element    ${CART_IDENTIFYING_ELEM}

Proceed to checkout
    Click Element    ${CHECKOUT_BUTTON}
    # If the user is not logged in, it will be prompted to do so
    ${modal_present} =    Run Keyword And Return Status    Page Should Contain Element    ${CHECKOUT_MODAL_ELEM}
    IF    ${modal_present}
        Click Element    ${MODAL_LOGIN_BUTTON}
        # Handle login and get back to cart and then checkout
        LoginPage.Login
        TopNav.Press "Cart" tab
        Click Element    ${CHECKOUT_BUTTON}
    END