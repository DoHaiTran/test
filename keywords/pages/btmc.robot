***Settings***
Resource    ../../resources/imports_resources.robot
Resource    ./locator/btmc.robot

***Keywords***
Verify price table is visible
    common_keywords.Verify Element Is Visible    ${dictBTMC.priceTable}

Get price of 1/10 ounce
    [Arguments]     ${type}
    Verify price table is visible
    @{list_type}     Get WebElements     ${dictBTMC.typeOfGoldList}
    ${type_of_gold}       Create List
    FOR     ${locator}     IN      @{list_type}
        ${name}     Get Text        ${locator}
        Append To List      ${type_of_gold}       ${name}
    END
    Length Should Be    ${type_of_gold}     ${8}

    ${index}        Get Index From List  ${type_of_gold}  ${type}
    IF  ${index} > -1
        ${row_index}    Evaluate    2+${index}
        ${price}     Get Table Cell      ${dictBTMC.priceTable}    ${row_index}   5
        Return From Keyword    ${price}
    ELSE 
        Return From Keyword     Log     There is no ${type} in gold list
    END

Verify price unit is visible
    common_keywords.Verify Element Is Visible  ${dictBTMC.priceUnit}

Get unit price
    Verify price unit is visible
    ${text_price_unit}      Get Text    ${dictBTMC.priceUnit}
    ${price_unit}       String.Get Substring        ${text_price_unit}      -9       
    ${price_unit}       String.Remove String        ${price_unit}       .   VNĐ
    BuiltIn.Convert To Number   ${price_unit}
    [Return]        ${price_unit}

Calculate price of 1 ounce
    [Arguments]     ${type}      
    ${price_unit}       Get unit price
    ${price}        Get price of 1/10 ounce  ${type}
    ${price_1_ounce}        BuiltIn.Evaluate        10*${price_unit}*${price}
    [Return]        ${price_1_ounce}

Compare price in 1 ounce
    [Arguments]     ${gold1}    ${gold2}
    ${price1}       Calculate price of 1 ounce  ${gold1}
    ${price2}       Calculate price of 1 ounce  ${gold2}
    IF  ${price1} > ${price2}  
        Log     Price of ${gold1} is higher than price of ${gold2}
    ELSE IF     ${price1} < ${price2}
        Log     Price of ${gold2} is higher than price of ${gold1}
    ELSE 
        Log     Price of ${gold1} is equal price of ${gold2}
    END
    