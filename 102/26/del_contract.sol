// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract DeleteContract {
    uint public value = 10;

    constructor() payable {}

    receive() external payable { }

    function delContract() external {
        selfdestruct(payable(msg.sender));
    }

    function getBalance() external view returns (uint) {
        return address(this).balance;
    }
}