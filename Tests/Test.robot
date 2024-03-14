*** Settings ***
Resource    ../Resources/SharedLogic.robot
Resource    ../Resources/TestApp.robot

Suite Setup    Start Web Test Suite
Suite Teardown    End Web Test Suite


*** Variables ***
@{SEARCH_TERMS} =    men tshirt    sleeveless dress


*** Test Cases ***
Should be able to open "Home" page
    TestApp.Go to "Home" page

Should be able to open 'Products' page
    TestApp.Go to "Products" page

Should be possible to search for products
    TestApp.Search for product    ${SEARCH_TERMS}[0]

Should be possible to add a product to cart
    TestApp.Add current product to cart

Should be possible to add another product to cart
    TestApp.Search for product    ${SEARCH_TERMS}[1]
    TestApp.Add current product to cart

Cart should be inspectable
    TestApp.Go to "Cart" page

Proceed to checkout
    TestApp.Go to "Checkout" page

All added products should be present in cart
    # Cycle through the predefined search terms and check if they're present
    FOR    ${element}    IN    @{SEARCH_TERMS}
        TestApp.Check for product in cart    ${element}
        
    END

Cart total is correct
    # Check amount of items we added to cart
    ${length} =    Get Length    ${SEARCH_TERMS}
    TestApp.Check cart total    ${length}
