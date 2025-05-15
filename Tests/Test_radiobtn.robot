*** Settings ***
Documentation    To validate the radiobuttons in DemoSite
Library    SeleniumLibrary
Test Teardown    Close Browser

*** Test Cases ***

Radiobutton
  Open the Browser with the URL  
  Select impressive options from 3 radio buttons
  Verify that the radio button is selected

*** Keywords ***
Open the Browser with the URL
#  Create Webdriver    driver_name=chrome   module obj is not callable error
  Open Browser    browser=chrome
  Go To    https://demo.automationtesting.in/Register.html
  Maximize Browser Window
  Set Selenium Implicit Wait    5

Select impressive options from 3 radio buttons  
  Page Should Contain Radio Button    radiooptions
  Page Should Not Contain Radio Button    checkbox2
#   Radio Button Should Be Set To    group_name=     value=//input[@value="FeMale"]
  Select Radio Button    radiooptions    FeMale

Verify that the radio button is selected
  Select Radio Button    radiooptions    FeMale
