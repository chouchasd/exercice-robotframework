*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Ajouter un produit au panier
    Open Browser    https://ecommerce-playground.lambdatest.io/    Chrome
    Title Should Be    Your Store
    Input Text    css=#entry_217822 > .search-wrapper > form > #search > .search-input-group > .search-input > .flex-fill > input    HTC Touch HD
    Click Button    css=button[type="submit"]:contains("Search")
    Wait Until Page Contains    Search - HTC Touch HD
    Click Button    css=#entry_212469 > .row > :nth-child(1)
    Click Button    css=button[title="Add to Cart"]:contains('Add to Cart')
    Wait Until Page Contains    Success: You have added
    Wait Until Element Is Visible    css=#entry_217825 a[aria-controls="cart-total-drawer"]
    Click Button    css=#entry_217825 a[aria-controls="cart-total-drawer"]
    Click Link    css=a[href="https://ecommerce-playground.lambdatest.io/index.php?route=checkout/cart"]

Modifier la quantité de produit dans le panier
    Open Browser    https://ecommerce-playground.lambdatest.io/    Chrome
    Title Should Be    Your Store
    Input Text    css=#entry_217822 > .search-wrapper > form > #search > .search-input-group > .search-input > .flex-fill > input    HTC Touch HD
    Click Button    css=button[type="submit"]:contains("Search")
    Wait Until Page Contains    Search - HTC Touch HD
    Click Button    css=#entry_212469 > .row > :nth-child(1)
    Click Button    css=button[title="Add to Cart"]:contains('Add to Cart')
    Wait Until Page Contains    Success: You have added
    Go To    https://ecommerce-playground.lambdatest.io/index.php?route=checkout/cart
    Input Text    css=input[style="min-width:3em"]    5
    Click Button    css=i[class="fas fa-sync-alt"]
    Wait Until Page Contains    Success: You have modified your shopping cart!

Supprimer un produit du panier
    Open Browser    https://ecommerce-playground.lambdatest.io/    Chrome
    Title Should Be    Your Store
    Input Text    css=#entry_217822 > .search-wrapper > form > #search > .search-input-group > .search-input > .flex-fill > input    HTC Touch HD
    Click Button    css=button[type="submit"]:contains("Search")
    Wait Until Page Contains    Search - HTC Touch HD
    Click Button    css=#entry_212469 > .row > :nth-child(1)
    Click Button    css=button[title="Add to Cart"]:contains('Add to Cart')
    Wait Until Page Contains    Success: You have added
    Go To    https://ecommerce-playground.lambdatest.io/index.php?route=checkout/cart
    Click Button    css=button[class="btn btn-danger"]
    Wait Until Page Contains    Success: You have modified your shopping cart!
    Wait Until Page Contains    Your shopping cart is empty!
