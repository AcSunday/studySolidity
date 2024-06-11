// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract FallBack {
    event Received(address sender, uint value);
    event fallbackCalled(address sender, uint value, bytes data);

    // 接收ETH，没data的时候触发
    receive() external payable {
        emit Received(msg.sender, msg.value);
    }

    // 接收ETH，有data，或没receive()的时候触发
    fallback() external payable {
        emit fallbackCalled(msg.sender, msg.value, msg.data);
    }
}