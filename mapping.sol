// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
// MAPPING IN SOLIDITY; MSG.SENDER
//contract Busayo{

    //mapping (address => uint)public  favouriteNumber;

    //function SetMyNumber(uint x)public {
       // favouriteNumber[msg.sender]=x;
   // } 

    //function WhatisMyNumber()public view returns(uint){
        //favouriteNumber[msg.sender];
        
    //}


//}


contract zinny{
     mapping (address => uint)public Mynumber;

     function addamount(uint y)public {
        Mynumber[msg.sender]=y;

        
     }

     function toviewamount()public  view returns(uint){
        return Mynumber[msg.sender];

     }


     }
// EVENT IN SOLIDITY
contract love{
    event integersmultiply(uint x,uint y,uint result);

    function add(uint x, uint y)public  returns(uint){
        uint result = x*y;

        emit integersmultiply (x,y,result);
        return  result;
        // this is to broadcast event from backend to frontend.
    

    }

}




