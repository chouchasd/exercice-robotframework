*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${BASEURL}    https://ecommerce-playground.lambdatest.io/
${ADDTOCART}     //div[@id='entry_216842']//button[@title='Add to Cart'][normalize-space()='Add to Cart']
${UPDATECART}    i[class="fas fa-sync-alt"]
${REMOVE}    button[class="btn btn-danger"]

*** Test Cases ***
Ajouter un produit au panier
    Open Browser    ${BASEURL}    chrome
    Title Should Be    Your Store
    Maximize Browser Window
    Input Text      //div[@id='entry_217822']//input[@placeholder='Search For Products']   HTC Touch HD
    Click Button    //button[normalize-space()='Search']
    Page Should Contain    Search - HTC Touch HD
    Click Element   //a[@id='mz-product-grid-image-28-212469']//div[@class='carousel-item active']//img[@title='HTC Touch HD']
    Click Button    ${ADDTOCART}
    Wait Until Element Is Visible    css:a[aria-controls="cart-total-drawer"]
    Click Element    css:a[aria-controls="cart-total-drawer"]
    Click Link    https://ecommerce-playground.lambdatest.io/index.php?route=checkout/cart
    


Modifier la quantité de produit dans le panier
    Open Browser    ${BASEURL}    chrome
    Title Should Be    Your Store
    Maximize Browser Window
    Input Text      //div[@id='entry_217822']//input[@placeholder='Search For Products']   HTC Touch HD
    Click Button    //button[normalize-space()='Search']
    Page Should Contain    Search - HTC Touch HD
    Click Element   //a[@id='mz-product-grid-image-28-212469']//div[@class='carousel-item active']//img[@title='HTC Touch HD']
    Click Button    ${ADDTOCART}
    Wait Until Element Is Visible    css:a[aria-controls="cart-total-drawer"]
    Click Element    css:a[aria-controls="cart-total-drawer"]
    Click Link    https://ecommerce-playground.lambdatest.io/index.php?route=checkout/cart
    Clear Element Text  name="quantity[53597]"
    Input Text    //input[@name='quantity[53555]']   5
    Click Element    //i[@class='fas fa-sync-alt']
    Page Should Contain    Success: You have modified your shopping cart!


Supprimer un produit du panier
    Open Browser    ${BASEURL}    chrome
    Title Should Be    Your Store
    Maximize Browser Window
    Input Text    //div[@id='entry_217822']//input[@placeholder='Search For Products']    HTC Touch HD
    Click Button    //button[normalize-space()='Search']
    Page Should Contain    Search - HTC Touch HD
    Click Element    id:entry_212469 > .row > :nth-child(1)
    Click Button    ${ADDTOCART}
    Page Should Contain    Success: You have added
    Go To    https://ecommerce-playground.lambdatest.io/index.php?route=checkout/cart
    Click Element    ${REMOVE}
    Page Should Contain    Your shopping cart is empty!
    [Teardown]    Close All Browsers