// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract  Zinny{
    address public  Owner;
    constructor () {
        Owner = msg.sender;

    }
    modifier onlyOwner(){
        require(msg.sender == Owner, "You are not the owner big head");
       _; 
    
    }
    function setOwner(address _newOwner) public onlyOwner{
        require(_newOwner != address(0) , "invalid address ");
     Owner = _newOwner;
    }

    function anyonecancall() public {}



}