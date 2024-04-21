*** Settings ***
Library         SeleniumLibrary
Resource        variables.robot

*** Keywords ***
Open Url
    [Arguments]   ${base}
    Open Browser     ${base}    chrome 
    Maximize Browser Window
    Title Should Be  Your Store