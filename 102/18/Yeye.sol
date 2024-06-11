// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Yeye {
    function say() external virtual returns (string memory) {
        return "Yeye";
    }
}