*** Settings ***
Documentation    All the Page objects and keywords of Password page
Library    SeleniumLibrary

*** Variables ***
${dashboard_title}    css:.oxd-topbar-header-breadcrumbs-module

*** Keywords ***
verify Dashboard page opens
    Element Text Should Be    ${dashboard_title}    Dashboard