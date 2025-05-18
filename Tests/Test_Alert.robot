*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close Browser

*** Test Cases ***
Handle All Alerts
    Open the Browser with the URL
    Handle Simple Alert
    Handle Confirm Alert
    Handle Prompt Alert

*** Keywords ***
Open the Browser with the URL
    Open Browser    https://demo.automationtesting.in/Alerts.html    chrome
    Maximize Browser Window
    Set Selenium Implicit Wait    5

Handle Simple Alert
    Click Element    (//a[@class="analystic"])[1]
    Click Element    //button[@class="btn btn-danger"]
    # ${message}=    Handle Alert
    # Log To Console    Simple Alert Text: ${message}
    Alert Should Be Present    I am an alert box!    ACCEPT

Handle Confirm Alert
    Click Element    (//a[@class="analystic"])[2]
    Click Element    //button[@class="btn btn-primary"]
    # ${message}=    Handle Alert   
    # Log To Console    Confirm Alert Text: ${message}
    # # Should Be Equal    ${message}    Press a Button !
    Alert Should Be Present    Press a Button !    DISMISS 
    Page Should Contain    You Pressed Cancel


Handle Prompt Alert
    Click Element    (//a[@class="analystic"])[3]
    Sleep    time_=3s
    Click Element    //button[@class="btn btn-info"]
    Sleep    time_=3s
    Input Text Into Alert    Laksitha
    Sleep    time_=5s
    ${message}=    Handle Alert
    Page Should Contain    Laksitha


