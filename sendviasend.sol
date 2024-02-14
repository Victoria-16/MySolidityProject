// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract money{
 
function sendViaSend(address payable _to, uint amount) public payable {
 
     bool sent = _to.send(amount);
     require(sent, "failed to send ether");
     //nexting mapping is when you want to have more items in a mapping
     //ABI(APPLICATION BINARY INTERFACE CONNECT WEB3 WITH THE FRONT END 
    //WEB3 JAVASCRIPT INTERPRET YOUR SOLIDITY SMART CONTRACT BY MAKING USE OF THE ABI TO TAKE INPUT AND THE ADDRESS

    }

 
}
