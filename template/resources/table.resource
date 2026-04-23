*** Settings ***
Documentation    tables
Resource    ${EXECDIR}${/}resources${/}common.resource
Variables    ${EXECDIR}${/}locators${/}table.py


*** Keywords ***
Read Cell Value
    [Arguments]    ${row_locator}    ${column_name}    ${index}=0

    Wait For Elements State    ${row_locator}    visible    timeout=${G_TIMEOUT}
    ${column_index}=    Get Column Index By Column Name    ${column_name}    ${index}
    ${cell_value}=    Get Text    ${row_locator} >> .cell-data[column-index='${column_index}']

    RETURN    ${cell_value}


Get Column Index By Column Name
    [Arguments]    ${column_name}    ${index}=0

    ${column_cell}=    Format String    ${T_COLUMN_CELL}    title=${column_name}    index=${index}
    Wait For Elements State    ${column_cell}    visible    timeout=${G_TIMEOUT}
    ${column_index}=    Get Attribute    ${column_cell}    column-index

    RETURN    ${column_index}


Get Line Count
    Wait For Elements State    ${L_TABLE} >> .row-data >> nth=3    visible    120s

    Safe Click    ${L_SETTINGS_ICON}
    Safe Click    ${L_NUMBER_LINES_ITEM}

    Wait For Elements State    ${L_MB_TEXT}    visible    30s
    ${text_value}=    Get Text    ${L_MB_TEXT}
    ${line_count}=    Convert To Integer    ${text_value}

    Safe Click    ${L_MB_FOOTER}
    RETURN    ${line_count + 1}
