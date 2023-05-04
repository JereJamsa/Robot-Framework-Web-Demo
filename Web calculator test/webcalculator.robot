*** Settings ***
Documentation    Tests buttons and simple calculations

Resource    resource.robot

*** Test Cases ***
Open Calculator On Localhost
    Open Browser To Calculator Page

Calculate
    Calculation    6    +    3
    Check Result    9

    Calculation    1    2    3    4    5    6    7    8    9    -    1
    Check Result    123456788

    Calculation    4    7    *    2
    Check Result    94

    Calculation    2    5    /    2
    Check Result    12.5

