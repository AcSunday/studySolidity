// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Pair {
    address public factory;
    address public tokenA;
    address public tokenB;

    constructor() payable {
        factory = msg.sender;
    }

    function initialize(address _tokenA, address _tokenB) external {
        require(msg.sender == factory, "UniswapV2: FORBIDDEN");
        tokenA = _tokenA;
        tokenB = _tokenB;
    }
}