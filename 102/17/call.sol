// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "./lib.sol";

contract CallLib {
    using Strings for uint256;

    function getString1(uint256 n) public pure returns(string memory) {
        return n.toHexString();
    }
}