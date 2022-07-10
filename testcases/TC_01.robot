***Settings***
Resource    ../resources/imports_resources.robot
Resource    ../keywords/common/common_keywords.robot
Resource    ../keywords/pages/btmc.robot
Resource    ../keywords/pages/goldprice.robot

***Variables***  
&{type}=       sjc=VÀNG MIẾNG SJC         btmc=VÀNG TRANG SỨC 999.9     test=test       

***Keywords***
Compare price between BTMC price and SJC price
    btmc.Compare price in 1 ounce  ${type.sjc}  ${type.btmc}

***Test Cases***
TC1: Compare price between BTMC price with SJC price
    common_keywords.Open Web Page  ${url.btmc}
    Compare price between BTMC price and SJC price
    common_keywords.Close Web Page
    