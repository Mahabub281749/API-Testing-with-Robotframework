*** Settings ***

Library    XML
Library    os
Library    RequestsLibrary
Library    Collections

*** Variables ***

${base_url}    https://www.w3schools.com/

*** Test Cases ***

Get_LetterInfo

    create Session    mysession    ${base_url}
    ${response}=    get request    mysession    /xml/note.xml

    ${xml_string}=    convert to string   ${response.content}
    ${xml_obj}=    parse xml    ${xml_string}

    # Validation

    # Val1: Check the single element value

    ${Letter_to}=    get element text    ${xml_obj}    .//to
    should be Equal    ${Letter_to}    Tove  

    # Approach 2

    ${Letter_to}=    get element  ${xml_obj}    .//to
    should be Equal    ${Letter_to.text}    Tove

    # Approach 3

    element text should be    ${xml_obj}    Tove    .//to 

    # Val2: Check Multiple value

    ${child_element}=    get child elements    ${xml_obj} 
    should not be empty    ${child_element} 

    ${Letter_from}=    get element text    ${child_element[1]}
    ${Letter_heading}=    get element text    ${child_element[2]}

    log to console    ${Letter_from}
    log to console    ${Letter_heading}

    should be Equal    ${Letter_from}    Jani    
    should be Equal    ${Letter_heading}    Reminder

