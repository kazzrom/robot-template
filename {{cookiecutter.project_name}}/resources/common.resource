*** Settings ***
Library    Browser
Library    String
Library    DateTime
Library    Collections
Library    OperatingSystem
Variables    ${EXECDIR}${/}variables${/}global.py
Variables    ${EXECDIR}${/}variables${/}paths.py


*** Keywords ***
Safe Click
    [Arguments]    ${locator}    ${timeout}=60s
    Wait For Elements State    .loading-panel    hidden    ${timeout}
    Wait For Elements State    ${locator}    stable    ${timeout}
    Click    ${locator}    


Safe Fill
    [Arguments]    ${locator}    ${text}    ${timeout}=60s
    Wait For Elements State    css=#adorner    hidden    ${timeout}
    Wait For Elements State    ${locator}    stable    ${timeout}
    Fill Text    ${locator}    ${text}
