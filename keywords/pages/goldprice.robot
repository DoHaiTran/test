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

Verify select gold price by country and weight
    [Arguments]     &{dict}
    Verify select item from drop down list by label  ${dictGP.goldSilverList}  ${dict.goldSilver}
    Verify select item from drop down list by value  ${dictGP.countryList}  ${dict.country}
    Verify select item from drop down list by label  ${dictGP.weightList}  ${dict.weight}

Get gold price 1 ounce
    [Arguments]     &{dict}
    Verify select gold price by country and weight  &{dict}
    ${price}        Get Text        ${dictGP.price}
    ${price}       String.Remove String        ${price}       ,   
    BuiltIn.Convert To Number   ${price}
    [Return]        ${price}
