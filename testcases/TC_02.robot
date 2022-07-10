***Settings***
Resource    ../resources/imports_resources.robot
Resource    ../keywords/common/common_keywords.robot
Resource    ../keywords/pages/btmc.robot
Resource    ../keywords/pages/goldprice.robot

***Variables*** 
&{type}=       sjc=VÀNG MIẾNG SJC         btmc=VÀNG TRANG SỨC 999.9     
&{option}=       goldSilver=Gold         country=USD     weight=oz       
&{option1}=       goldSilver=Gold         country=VND     weight=oz

***Keywords***
Compare price between gold price and SJC price
    [Arguments]     ${gold1}    ${gold2}    ${price1}   ${price2}
    IF  ${price1} > ${price2}  
        Log     Price of ${gold1} is higher than price of ${gold2}
    ELSE IF     ${price1} < ${price2}
        Log     Price of ${gold2} is higher than price of ${gold1}
    ELSE 
        Log     Price of ${gold1} is equal price of ${gold2}
    END
    
***Test Cases***
TC2: Compare price between world gold price with SJC gold price
    common_keywords.Open Web Page  ${url.btmc}
    ${price1}       btmc.Calculate price of 1 ounce  ${type.sjc}
    common_keywords.Open Web Page  ${url.gp}
    ${price2}        goldprice.Get gold price 1 ounce  &{option1}
    Compare price between gold price and SJC price  ${type.sjc}  ${option1.goldSilver}  ${price1}  ${price2}
    Close All Browsers
