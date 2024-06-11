// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Func {
    uint256 nb = 123;

    function returnName() public pure returns(uint256 _number, bool _bool, uint256[3] memory _array) {
        _number = 2;
        _bool = false;
        _array = [uint256(3), 2, 3];
    }

    function callFoo() public pure returns(uint256 number) {
        (number,,) = returnName();
        // number = nb;
    }
}