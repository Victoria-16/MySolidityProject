// SPDX-License-Identifier: MIT
pragma solidity ^ 0.8 .0;
contract ReceiveEther{
    receive() external payable { }

 function   getBalance () public view returns (uint)   {
    return address(this).balance;
 }
}

contract sendEther{
    receive() external payable { }
    
    function SendViaTransfer(address payable to, uint amount)   public payable {
    to.transfer(amount);

    }
}

contract CollectEther{ 


    function sendViaSend(address payable _to, uint amount) public payable {
        // FUNCTION INVOLVING MONEY MUST HAVE PAYABLE
    
        bool sent = _to.send(msg.value);
        // _to.send is where you can add the person' account details
        require(sent, "Failed to send Ether");
    }
    receive() external payable { }
    
    
}
contract RetriveEther{
    function sendViaCall(address payable _to) public payable {
        (bool sent, bytes memory data) = _to.call{value:msg.value}("");
        require (sent, "Failed to send Ether");

    }
         
     receive() external payable { }
    

}
