// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
// interface are ways of writing ERC20 Token, an interface is a way of standardizing Tokenization. it wll allow your token to conform to the standard of ERC20. In interfaces, we write those functions but we do not implement them.in writing, it is IERC20{}.

interface IERC20{
function totalSupply() external view returns(uint); //functions in interface cannot have an implementation, that means it cannot accept a curly bracket,instead use a semi column;  //total number of Tokens created and supplied by the owner
function balanceOf(address account) external view returns(uint);// current balance available in the wallet address account 
function transfer(address recepient, uint amount) external returns(bool);//
function allowance(address owner, address spender) external view returns(uint);
function approve(address spender, uint amount) external returns(bool);
 
function transferFrom(address sender, address recepient, uint amount)
external payable  returns(bool);//external − External functions are meant to be called by other contracts. They cannot be used for internal call. To call external function within contract this.
// inheritance n import  in solidity means to get or inherit proprties from solidity.  using '"is
 //external means anyone can access the function unless the smart contract itself. So only other smart contracts and addresses that interact with .

event Transfer(address indexed from, address to, uint value);//The indexed keyword is used to make the parameters searchable by external systems, which can be useful for filtering and searching events.
event Approval (address indexed owner,address indexed spender,uint value);
}
contract ERC20 is IERC20 {
  uint public override totalSupply;
  mapping(address => uint) public override balanceOf;
mapping(address => mapping(address => uint)) public override allowance;
string public name ="MACKEY'S TOKEN";
string public symbol ="MACTK";
uint public decimal = 18;
 
function transfer(address recepient, uint amount)
external override returns(bool) {
 
balanceOf[msg.sender] -= amount;
balanceOf[recepient] += amount;
 
emit Transfer(msg.sender,recepient,amount);
return true;
}
function approve(address spender,uint amount)
external override returns(bool){
allowance[msg.sender][spender] = amount;

emit Approval(msg.sender,spender,amount);
return true;
}
function transferFrom(address sender,address recepient,uint amount)
external payable  override returns(bool){
allowance[sender][msg.sender] -= amount;
 balanceOf[sender] -= amount;
  //balanceOf[sender] =  balanceOf[sender] - amount;
 balanceOf[recepient] += amount;
 emit Transfer(sender, recepient, amount);
return true;
}
function mint(uint amount) external {
balanceOf[msg.sender] += amount;
totalSupply += amount;
emit Transfer(address(0), msg.sender, amount);
}
function burn(uint amount) external {
   balanceOf[msg.sender] -= amount;
    totalSupply -= amount;
    emit Transfer(msg.sender, address(0), amount);
}
}

