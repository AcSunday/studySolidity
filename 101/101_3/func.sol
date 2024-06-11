// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Func {
    uint8  number = 123;

    function add(uint8 n) external  {
        number += n;
    }

    function minus(uint8 n) internal {
        number -= n;
    }

    // 连参数都不能传
    function gatNumber() external view returns(uint8 nb) {
        nb = number + 1;
    }

    function testPure(uint8 n) external pure returns(uint8 nb) {
        nb = n + 1;
    }

    function callMinus(uint8 n) external  {
        minus(n);
    }

    function minusPayable() external payable returns(uint256 balance) {
        minus(uint8(1));
        balance = address(this).balance;
    }
}
