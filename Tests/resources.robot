*** Settings ***
Documentation    A resource file with reusable keywords and variables
Library    SeleniumLibrary

*** Variables ***
${valid_username}    Admin
${valid_password}    admin123
${invalid_username}    2345
${invalid_password}    12345
${url}    https://opensource-demo.orangehrmlive.com/web/index.php/auth/login

*** Keywords ***
Open the Browser with the URL
    Open Browser    browser=chrome
    Go To    ${url}
    Maximize Browser Window
    Set Selenium Implicit Wait    5

Close Browser Session
    Close Browser