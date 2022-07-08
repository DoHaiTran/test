***Settings***
Resource    ../../resources/imports_resources.robot
Resource    ./locator/goldprice.robot


***Keywords***
Verify select item from drop down list by label
    [Arguments]     ${list}     ${value}
    common_keywords.Verify Element Is Visible  ${list}
    Select From List By Label       ${list}        ${value}
    List Selection Should Be        ${list}        ${value}


Verify select item from drop down list by value
    [Arguments]     ${list}     ${value}
    common_keywords.Verify Element Is Visible  ${list}
    Select From List By Value       ${list}        ${value}
    List Selection Should Be        ${list}        ${value}

Verify select gold price 1 ounce by USD
    Verify select item from drop down list by label  ${dictGP.goldSilverList}  Gold
    Verify select item from drop down list by value  ${dictGP.countryList}  USD
    Verify select item from drop down list by label  ${dictGP.weightList}  oz

Get gold price 1 ounce
    Verify select gold price 1 ounce by USD
    ${price}        Get Text        ${dictGP.price}
    ${price}       String.Remove String        ${price}       ,   
    BuiltIn.Convert To Number   ${price}
    [Return]        ${price}

Convert gold price to VND
    [Arguments]     ${price_unit}       ${price}
    ${price}        BuiltIn.Evaluate        ${price_unit}*${price}
    [Return]        ${price}