// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

abstract contract InsertionSort{
    function insertionSort(uint[] memory a) public pure virtual returns(uint[] memory);
}

abstract contract Base {
    string public name = "Base";
    function getAlias() public pure virtual returns(string memory);
}

contract BaseImpl is Base {
    function getAlias() public pure override returns(string memory) {
        return ("BaseImpl");
    }
}