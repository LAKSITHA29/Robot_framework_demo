*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close Browser


*** Test Cases ***
Selecting the dropdown list
  Open the Browser with the URL
  Select the option API by value
  Select the option Microsoft Excel by index
  Select the option css by Label


*** Keywords ***
Open the Browser with the URL
    Open Browser    browser=chrome
    Go To    url=https://demo.automationtesting.in/Register.html
    Maximize Browser Window
    Set Selenium Implicit Wait    5

Select the option API by value
    Select From List By Value    Skills    APIs


Select the option Microsoft Excel by index
    Select From List By Index    Skills    20

Select the option css by Label
    Select From List By Label    Skills    CSS
    # FOR    ${OPTIONS}    IN    Skills

        
    # END
    
    
