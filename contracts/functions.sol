//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract funcDemo{
    //public
    // external - можно только извне обращаться
    // internal - можно обращаться только изнутри контракта + наследники контракта
    // private - можно обращаться только изнутри контракта, наследникам нельзя

    // view - не может изменять данные блокчейна, но можно их читать (не платим за ф-ию)
    // pure - вызывается тоже через call, но не может читать никакие данные для служебных функций

    //call
    string message = "hello!";
    function setMessage(string memory newMessage) external {
        message = newMessage;
    }
    function getBalance() public view returns(uint){
        uint balance = address(this).balance;
        return balance;
    }
        function getBalance1() public view returns(uint balance){
        balance = address(this).balance;
        // return balance;
    }
    function getMessage() external view returns(string memory){
        return message;
    }
    function rate(uint amount) public pure returns(uint){
        return amount * 3;
    }
}