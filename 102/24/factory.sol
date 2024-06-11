// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import {Pair} from "./pair.sol";

contract PairFactory {
    mapping(address => mapping(address => address)) public getPair;
    address[] public pairAddrs;

    function createPair(address tokenA, address tokenB) external returns(address pairAddr) {
        Pair p = new Pair();
        p.initialize(tokenA, tokenB);
        pairAddr = address(p);

        pairAddrs.push(pairAddr);
        getPair[tokenA][tokenB] = pairAddr;
        getPair[tokenB][tokenA] = pairAddr;
    }
}