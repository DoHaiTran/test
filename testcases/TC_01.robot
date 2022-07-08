***Settings***
Resource    ../resources/imports_resources.robot
Resource    ../keywords/common/common_keywords.robot
Resource    ../keywords/pages/btmc.robot
Resource    ../keywords/pages/goldprice.robot

***Variables***  
&{type}=       sjc=VÀNG MIẾNG SJC         btmc=VÀNG TRANG SỨC 999.9     test=test       

***Keywords***

Compare price between BTMC price and SJC price
    ${unit}     btmc.Get unit price
    # Log to console      Unit price: ${unit}
    ${price1}    btmc.Get price of 1/10 ounce  ${type.sjc}
    # Log to console     Price of 1/10 ounce sjc: ${price1}
    ${price2}    btmc.Get price of 1/10 ounce  ${type.btmc}
    # Log to console     Price of 1/10 ounce btmc: ${price2}
    ${price_sjc}    btmc.Calculate price of 1 ounce  ${unit}  ${price1}
    # Log to console  Price of sjc: ${price_sjc}
    ${price_btmc}   btmc.Calculate price of 1 ounce  ${unit}  ${price2}
    # Log to console  Price of BTMC; ${price_btmc}
    btmc.Compare price in 1 ounce  ${price_sjc}  ${price_btmc}  ${type.sjc}  ${type.btmc}
    # ${log}  btmc.Compare price in 1 ounce  ${price_sjc}  ${price_btmc}  ${type.sjc}  ${type.btmc}
    # Log to console  ${log}

***Test Cases***
TC1
    common_keywords.Open Web Page  ${url.btmc}
    Compare price between BTMC price and SJC price
    common_keywords.Close Web Page







    
