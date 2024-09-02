//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Demo{
    // Инструкции
    // require
    // revert
    // assert
    address owner;
    event Paid(address indexed _from, uint amount, uint _timestamp);
    constructor(){
        owner = msg.sender;
    }
    receive() external payable{
        pay();
    }
    function pay() public payable{
        emit Paid(msg.sender, msg.value, block.timestamp);
    }
    modifier onlyowner(address _to){
        require(msg.sender == owner, "You are not an owner");
        require(_to != address(0), "Address should not be null!!");
        _; //return from modifier and go to the function's body
        require(1==1, "Logic is broken"); //we can also do checks after function
    }
    function withdraw(address payable _to) external onlyowner(_to){
        // Panic
        // assert(msg.sender == owner);
        // require(msg.sender == owner, "You are not an owner");
        // if (msg.sender != owner){
        //     revert("You are not an owner");
        // } else{

        // }
            
        _to.transfer(address(this).balance);
    }
}