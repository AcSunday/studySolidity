// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Events {
    mapping(address => uint256) public _balances;

    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor(){
        _balances[msg.sender] = 1000000;
    }

    function _transfer(address from, address to, uint256 amount) external {
        _balances[from] -= amount;
        _balances[to] += amount;

        // 释放事件
        emit Transfer(from, to, amount);
    }
}