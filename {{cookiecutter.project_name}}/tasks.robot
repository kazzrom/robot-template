*** Settings ***
Documentation    {{ cookiecutter.project_name }}
Library    Browser
{%- if cookiecutter.include_it_enterprise == 'yes' %}
Resource    resources${/}it_enterprise.resource
{%- endif %}
Suite Setup    Initialization Robot
Suite Teardown    Finalization Robot


*** Test Cases ***
Start Robot
    Log To Console    Hello World, {{ cookiecutter.project_name }}!


*** Keywords ***
Initialization Robot
    New Browser    browser=chromium    headless=False
    New Context
    ...    viewport={'width': 1920, 'height': 1080}
    ...    userAgent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36
    ...    javaScriptEnabled=True


Finalization Robot
    Close Browser
