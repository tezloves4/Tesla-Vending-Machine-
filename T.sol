// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Teslavending{
    address public owner;
    mapping(address => uint) public Teslapicks;

     constructor(){
         owner = msg.sender;
         Teslapicks[address(this)]= 100;
     }

     function Tesla() public view returns (uint){
         return Teslapicks[address(this)];
     }

      function restock(uint amount) public {
         require(msg.sender == owner, "only the owner can restock this machine");
           Teslapicks[address(this)] += amount;
      }
      
      function purchase(uint amount) public payable {
          require(msg.value >= amount * 2 ether, "You must pay at least 2 ether per car");
          require ( Teslapicks[address(this)] >=amount, "Not enough Tesla's in stock to fufill this request purchase");
           Teslapicks[address(this)] -= amount;
           Teslapicks[address(this)] += amount;
      }

}
