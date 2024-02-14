// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;contract money{
 
 function sendViaCall(address payable _to, uint amount) public payable {
 
(bool sent, ) =   _to.call{value:amount}("");  
 
  require(sent, 'failed to send ether');
 
 }
 
 
}