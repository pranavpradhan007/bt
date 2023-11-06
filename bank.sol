// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;


contract bank{

          address public  owner;
          uint public amount;
          uint public balance;
          


          constructor(){
              owner=msg.sender;
              balance=34;
          }
             

         modifier onlyOwner(){
            require(msg.sender==owner,"Only the owner can perform this operation");
            _;

         }
        
         function deposite(uint256 amount) public onlyOwner{
           require(amount>0,"Deposite amount must be greater than zero");
           balance=balance+amount;
         }
         function withdraw(uint256 amount) public onlyOwner{
            
           require(amount>0,"withdrwal amout possible only when amount is greater than zero");
           require(amount<=balance,"withdrwal only possible for amount less than available amount in acccount");
           balance=balance-amount;
         }

         function getbalance() public view returns(uint256){
              return balance;
         }
}