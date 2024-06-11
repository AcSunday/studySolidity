// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract ConstructorLearn {
    address public owner; // 定义owner变量

    // 构造函数
    constructor() {
        owner = msg.sender;
    }

    // 定义modifier
    modifier onlyOwner {
        require(msg.sender == owner); // 检查调用者是否为owner地址
        _; // 如果是的话，继续执行函数主体；否则报错并revert交易
    }

    function getOwner() external view returns(address) {
        return (owner);
    }

    function changeOwner(address newOwner) external onlyOwner {
        owner = newOwner;
    }
}