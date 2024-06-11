// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract C {
    uint256 public num;
    address public sender;

    function setVars(uint256 n) public payable  {
        num = n;
        sender = msg.sender;
    }
}