// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract chinyere{
    struct tech4dev{
        uint age;
        string name;
        string gender;
    }
    tech4dev[]public peace;
    
    
}

contract victoria{
    struct tech4dev{
        string name;
        uint age;
        string laptopbrand;
        uint phonenumber;
        string phonebrand;
    }
    tech4dev[]public  joy;
  tech4dev beauty= tech4dev("victoria onah", 33,"dell", 7068702724,"samgung");


}
// class work; create a struct for the following, name, age, amount, and phonenumber. Then create an arrary of struct with arrary name iceprince.Then try to insert the following (micheal, 10, 100, 2349073418680)
contract vera{
    struct goodhealth{
        string name;
        uint age;
        uint amount;
        uint phonenumber;
    }
    goodhealth[]public iceprince;
     goodhealth nice= goodhealth("micheal", 10, 100, 2349037341868);
     goodhealth joy = goodhealth("love", 10, 40,4654);
     //add the above to the arrary

     function love() public {
     iceprince.push(nice);
     iceprince.push(joy);

     }
     
}
