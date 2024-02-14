// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
/*Nested mapping is basically the connection of two mapping 
mapping in solidity is also known for storing data, 
they are hash tables that store data as key-value pairs, where the key can be any of the built-in data types 
supported by Ethereum.

 For example,if in a program we have the user's name and it's age and we want 
to store this information with the help of the specific id through which other's can fetch it
 with the help of that id only,we can make use  of Nested mapping.  This concept is know as the double mapping in the solidity. Basically Nested mapping is mapping from one mapping to another. 
 Below is a an illustration of a Nested Mapping:*/ 

 contract Nestedmap{
    mapping( uint => mapping(string => uint)) public User;

    function AddUser(uint _Id, string memory _name,uint _age) public {
        User[_Id][_name] = _age;
    }

 

 function user(uint256 _Id,string memory _name)public view returns(uint){

  return User[_Id][_name];
  }
 }