// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Other {
    uint256 private x = 0;

    // 收到eth的事件
    event Log(uint amount, uint gas);

    function getBalance() view public returns (uint) {
        return address(this).balance;
    }

    function setX(uint256 n) external payable  {
        x = n;
        if (msg.value > 0) {
            emit Log(msg.value, gasleft());
        }
    }

    function getX() external view returns (uint) {
        return x;
    }
}