*** Settings ***
Documentation    Запуск IT-Enterprise и авторизация в системе.
Resource    ${EXECDIR}${/}resources${/}common.resource
Variables    ${EXECDIR}${/}locators${/}it_enterprise.py


*** Variables ***
${G_URL_IT_ENTERPRISE}    http://192.168.0.72/ClientRMD/


*** Keywords ***
Run IT-Enterprise
    [Documentation]    Запуск IT-Enterprise

    Log To Console    \n\nit_enterprise.resource
    Log To Console    STAGE: Авторизация в IT-Enterprise
    Authorization IT-Enterprise

    Log To Console    STAGE: Смена группы профиля
    Change Profile Group


Authorization IT-Enterprise
    [Documentation]    Авторизация в системе IT-Enterprise

    New Page    ${G_URL_IT_ENTERPRISE}

    Safe Fill    ${L_INPUT_LOGIN}    %{IT_LOGIN}
    Safe Fill    ${L_INPUT_PASSWORD}    %{IT_PASSWORD}

    Safe Click    ${L_BTN_LOGIN}

    Wait For Elements State    ${L_MENU_ITEM_FAVORITES}    visible    timeout=60s


Change Profile Group
    [Documentation]    Смена группы профиля на "Главный бухгалтер" для доступа к необходимым функциям в IT-Enterprise

    Safe Click    ${L_ICON_PROFILE}
    Safe Click    ${L_SELECT_GROUP}
    Safe Click    ${L_OPTION_CHIEF_ACCOUNTANT}
