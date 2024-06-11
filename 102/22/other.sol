// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Other {
    uint256 private x = 0;
    event Log(uint amount, uint gas);

    fallback() external payable {}

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function setX(uint256 n) external payable  {
        x = n;
        if(msg.value > 0){
            emit Log(msg.value, gasleft());
        }
    }

    function getX() external view returns(uint) {
        return x;
    }
}