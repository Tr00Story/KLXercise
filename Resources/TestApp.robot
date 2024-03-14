*** Settings ***
Resource    ./PageObjects/HomePage.robot
Resource    ./PageObjects/ProductsPage.robot
Resource    ./PageObjects/CartPage.robot
Resource    ./PageObjects/CheckoutPage.robot
Resource    ./PageObjects/TopNav.robot


*** Keywords ***
Go to "Home" page
    HomePage.Navigate to
    HomePage.Verify page loaded

Go to "Products" page
    TopNav.Press "Products" tab
    ProductsPage.Verify page loaded

Search for product
    [Arguments]    ${search_term}
    ProductsPage.Search for product    ${search_term}
    ProductsPage.Verify search success    ${search_term}

Add current product to cart
    ProductsPage.Add to cart

Go to "Cart" page
    TopNav.Press "Cart" tab
    CartPage.Verify page loaded

Go to "Checkout" page
    CartPage.Proceed to checkout
    CheckoutPage.Verify page loaded

Check for product in cart
    [Arguments]    ${product_name}
    CheckoutPage.Validate if product is present    ${product_name}

Check cart total
    [Arguments]    ${items_nr}
    CheckoutPage.Validate total cost    ${items_nr}