// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// ERC20水龙头合约

import "../31/IERC20.sol";

contract Faucet {
    event SendToken(address indexed receiver, uint256 indexed amount);

    uint256 public amountAllowed = 100; // 每次领取100单位代币
    address public tokenContract; // token合约地址
    mapping (address => bool) public requestedAddress; // 记录领取过代币的地址

    constructor(address _tokenContract) {
        tokenContract = _tokenContract;
    }

    // 用户领取代币函数
    function requestTokens() external {
        require(requestedAddress[msg.sender] == false, "Can't request Multiple Times!"); // 防止超领
        IERC20 token = IERC20(tokenContract); // 创建IERC20合约对象
        require(token.balanceOf(address(this)) >= amountAllowed, "Faucet empty!"); // 水龙头空了

        token.transfer(msg.sender, amountAllowed); // 发送token
        requestedAddress[msg.sender] = true;
        emit SendToken(msg.sender, amountAllowed); // 释放SendToken事件
    }
}