***Settings***
Resource    ../resources/imports_resources.robot
Resource    ../keywords/common/common_keywords.robot
Resource    ../keywords/pages/btmc.robot
Resource    ../keywords/pages/goldprice.robot

***Variables***
# @{price_list}    Create List    
&{type}=       sjc=VÀNG MIẾNG SJC         btmc=VÀNG TRANG SỨC 999.9     test=test       
# ${NUMBER}=       ${1}


***Keywords***

Compare price between BTMC price and SJC price
    ${unit}     btmc.Get unit price
    Log to console      Unit price: ${unit}
    ${price1}    btmc.Get price of 1/10 ounce  ${type.sjc}
    Log to console     Price of 1/10 ounce sjc: ${price1}
    ${price2}    btmc.Get price of 1/10 ounce  ${type.btmc}
    Log to console     Price of 1/10 ounce btmc: ${price2}
    ${price_sjc}    btmc.Calculate price of 1 ounce  ${unit}  ${price1}
    Log to console  Price of sjc: ${price_sjc}
    ${price_btmc}   btmc.Calculate price of 1 ounce  ${unit}  ${price2}
    Log to console  Price of BTMC; ${price_btmc}
    ${log}  btmc.Compare price in 1 ounce  ${price_sjc}  ${price_btmc}  ${type.sjc}  ${type.btmc}
    Log to console  ${log}

Compare price between gold price and SJC price
    ${price}        goldprice.Get gold price 1 ounce
    ${gold_price}        goldprice.Convert gold price to VND  23081.00  ${price}
    ${unit}     btmc.Get unit price
    Log to console      Unit price: ${unit}
    ${price1}    btmc.Get price of 1/10 ounce  ${type.sjc}
    Log to console     Price of 1/10 ounce sjc: ${price1}
    ${price_sjc}    btmc.Calculate price of 1 ounce  ${unit}  ${price1}
    Log to console  Price of sjc: ${price_sjc}

***Test Cases***
TC1

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

    common_keywords.Open Web Page  ${url.gp}
    sleep       2s
    ${price}        goldprice.Get gold price 1 ounce
    ${a}        goldprice.Convert gold price to VND  23081.00  ${price}
    Log to console      ${a}
    common_keywords.Close Web Page

# TC2

#     # ${count}=   Set Variable    5
#     # ${value}=   Set Variable    a4
#     # @{list_test}    Create List    a1  a2  a3  a4  a5
#     # # FOR    ${index}    IN RANGE    5
#     # #     ${i}      Run Keyword If    '${list_test}[${index}]' == '${value}'    Set Variable    ${index}
#     # # END
#     # # [Return]  ${i}
#     # # Log to console      ${i}
#     # ${a}        Get Index From List  ${list_test}  a8
#     # Log to console      gia tri: ${a}

#     common_keywords.Open Web Page  ${url.btmc}
#     Compare price between BTMC price and SJC price
#     common_keywords.Close Web Page







    
