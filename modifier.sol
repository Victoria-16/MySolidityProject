// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract zinny{

    bool public guru;
    uint public cashmoney;

    modifier joyful() {
        require(guru);_;// when you are using a modifier, ensure to use an underscore
        cashmoney=cashmoney*8;
    }

        function pause (bool x) external{
        guru=x;
    
        }
        function increse()public joyful{
            cashmoney=cashmoney+5;// it will first execute function increae before it execute the modifier
            // you can double on either the increase or decrease twice to get a double result.

        }
        function decrese()public joyful{
            cashmoney=cashmoney-5;
        }
    }