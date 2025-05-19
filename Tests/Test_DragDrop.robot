*** Settings ***
Library    SeleniumLibrary
Test Teardown    Close Browser

*** Test Cases ***
Verify that the user can drag and drop the elements
    # [Documentation] This verifies if user can drag and drop form source to destination'
    Open the Browser with the URL
    Verify the element text before drag
    Drag And Drop the element
    Verify the element text before drop

*** Variables ***
${browser}

*** Keywords ***
Open the Browser with the URL
    Open Browser    ${browser}
    Go To    url=https://demoqa.com/droppable
    Maximize Browser Window
    Set Selenium Implicit Wait    5

Verify the element text before drag
    Element Text Should Be    id=droppable    Drop here     timeout=5      
    
 Drag And Drop the element
    Drag And Drop    id:draggable    id:droppable   
    # Sleep    5

 Verify the element text before drop
    Element Text Should Be    id=droppable    Dropped!     timeout=5   
