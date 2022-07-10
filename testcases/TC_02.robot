***Settings***
Resource    ../resources/imports_resources.robot
Resource    ../keywords/common/common_keywords.robot
Resource    ../keywords/pages/btmc.robot
Resource    ../keywords/pages/goldprice.robot

***Variables***
# @{price_list}    Create List    
&{type}=       sjc=VÀNG MIẾNG SJC         btmc=VÀNG TRANG SỨC 999.9     gp=GOLD PRICE       
# ${NUMBER}=       ${1}


***Keywords***

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
TC2
    common_keywords.Open Web Page  ${url.btmc}
    ${unit}     btmc.Get unit price
    ${price1}    btmc.Get price of 1/10 ounce  ${type.sjc}
    ${price_sjc}    btmc.Calculate price of 1 ounce  ${unit}  ${price1}
    common_keywords.Open Web Page  ${url.gp}
    ${price2}        goldprice.Get gold price 1 ounce
    ${price_gp}        goldprice.Convert gold price to VND  23081.00  ${price2}
    btmc.Compare price in 1 ounce  ${price_sjc}  ${price_gp}  ${type.sjc}  ${type.gp}
    Close All Browsers

#     common_keywords.Open Web Page  ${url.btmc}
#     Compare price between BTMC price and SJC price
#     common_keywords.Close Web Page







    
