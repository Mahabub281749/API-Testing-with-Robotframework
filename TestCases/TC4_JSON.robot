*** Settings ***
Library     JSONLibrary
Library     os
Library     Collections

***Test Cases***
TestCase 1:

    ${json_obj}=    load json from file      D:/Robot/TestCases/JSONDATA.json
    ${name_value}=      get value from json     ${json_obj}     $.firstName
    ${street_value}=    get value from json     ${json_obj}     $.address.streetAddress 
    ${fax_number}=      get value from json     ${json_obj}     $.phoneNumber[1].number       

    log to console      ${name_value[0]}
    log to console      ${street_value[0]}
    log to console      ${fax_number[0]}

    #Validations#

    should be Equal     ${name_value[0]}       Mahabub
    should be Equal     ${street_value[0]}     Karakalliontie 2
    shouldbe Equal      ${fax_number[0]}        111111          

