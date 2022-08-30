*** Settings ***
Library     JSONLibrary
Library     os
Library     Collections
Library     RequestsLibrary

***Variables***
${base_url}     https://restcountries.com

***Test Cases***
Get_CountryInfo

    create Session      mysession       ${base_url}
    ${response}=        get request     mysession    /v2/name/bangladesh

    ${json_obj}=    to json     ${response.content}

    # single data validation#

    ${country_name}=     get value from json     ${json_obj}    $.name 
    log to console      ${country_name[0]}
    should be Equal     ${country_name[0]}      Bangladesh         

    # Single data validation in array

    ${border_name}=     get value from json     ${json_obj}     $.borders[0]
    log to console      ${border_name[0]}  
    should be Equal     ${border_name[0]}   MMR

    # Multiple data validation in array

    ${borders}=     get value from json     ${json_obj}     $.borders
    log to console      ${border[0]}
    should Contain any     ${borders[0]}       MMR     IND

