*** Settings ***
Documentation    A reusable file with reusable keywords and variables
Library    SeleniumLibrary

*** Variables ***
${valid_uname}    Admin
${valid_pass}    admin123
${invalid_uname}    Admi
${invalid_pass}    123
${blank_name}
${blank_pass}
${url}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${browser_name}    chrome

*** Keywords ***
Open the Browser with the URL
    Open Browser    ${url}    ${browser_name}
    Maximize Browser Window
    Set Selenium Implicit Wait    5

Close Browser Session 
    Close Browser    
