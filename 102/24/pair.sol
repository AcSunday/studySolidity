// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Pair {
    address public factoryAddr;
    address public tokenA;
    address public tokenB;

    constructor() payable {
        factoryAddr = msg.sender;
    }

    function initialize(address _tokenA, address _tokenB) external {
        require(msg.sender == factoryAddr, "UniswapV2: forbidden");
        tokenA = _tokenA;
        tokenB = _tokenB;
    }
}