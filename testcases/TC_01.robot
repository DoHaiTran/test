***Settings***
Resource    ../resources/imports_resources.robot
Resource    ../keywords/common/common_keywords.robot
Resource    ../keywords/pages/btmc.robot

***Variables***
# @{price_list}    Create List    
&{type}=       sjc=VÀNG MIẾNG SJC         btmc=VÀNG TRANG SỨC 999.9     test=test       
# ${NUMBER}=       ${1}


***Keywords***

# Calculate price of 1 ounce
#    [Arguments]                                      ${locator}                  
#    SeleniumLibrary.Wait Until Element Is Visible    ${locator}                  timeout=${TIMEOUT}
#    ${text}                                          SeleniumLibrary.Get Text    ${locator}
#    ${price}                                         Evaluate                    10*${text}
#    Append To List                                   ${price_list}               ${price}

# Find Index
#      [Arguments]               ${element}                              @{items}
#      ${length}=                Get Length                              ${items}
# #    FOR                       ${index}                                IN RANGE                                ${length}
# #    Return From Keyword If    '${items}[${index}]' == '${element}'    ${index}
# #    END
#      FOR                       ${index}                                IN RANGE                                ${length}
#      ${i}                      Run Keyword If                          '${items}[${index}]' == '${element}'    Set Variable    ${index}
#      END
#      [Return]                  ${i}

***Test Cases***
# TC1
#    common_keywords.Open Web Page
#    sleep                             2s
#    Calculate price of 1 ounce        ${dictBTMC.sjc}
#    Calculate price of 1 ounce        ${dictBTMC.btmc}
#    Log to console                    ${price_list}
#    common_keywords.Close Web Page

TC2

    # ${count}=   Set Variable    5
    # ${value}=   Set Variable    a4
    # @{list_test}    Create List    a1  a2  a3  a4  a5
    # # FOR    ${index}    IN RANGE    5
    # #     ${i}      Run Keyword If    '${list_test}[${index}]' == '${value}'    Set Variable    ${index}
    # # END
    # # [Return]  ${i}
    # # Log to console      ${i}
    # ${a}        Get Index From List  ${list_test}  a8
    # Log to console      gia tri: ${a}




    common_keywords.Open Web Page
    sleep       2s
    ${a}    Get text    //span[@class='mr-5']//parent::h3
    Log to console  gia tri: ${a}


    common_keywords.Close Web Page







    
