// SPDX-License-Identifier: MIT
pragma solidity ^ 0.8.0;
contract todo{
 
struct micro{
   string title;
   bool completed;
}
 
micro[] public tech;
 
function insert(string memory _title) public  {
 
tech.push(micro(_title,false));
}
 
function update(uint index, string memory _title) public {
tech[index].title = _title;
//concatination
 
}
function status(uint index) public {
    tech[index].completed = true;
}
 
}