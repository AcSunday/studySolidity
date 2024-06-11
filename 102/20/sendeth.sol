// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

error SendFailed();
error CallFailed();

contract ReceiveETH {
    // 收到eth事件，记录amount和gas
    event Log(uint amount, uint gas);
    
    // receive方法，接收eth时被触发
    receive() external payable{
        emit Log(msg.value, gasleft());
    }
    
    // 返回合约ETH余额
    function getBalance() view public returns(uint) {
        return address(this).balance;
    }
}

contract SendETH {
    constructor() payable{}
    receive() external payable {}

    // // 有gas 2300限制，会回滚
    function transferETH(address payable to, uint256 amount) external payable {
        to.transfer(amount);
    }

    // 有gas 2300限制，不会回滚
    function sendETH(address payable to, uint256 amount) external payable {
        bool ok = to.send(amount);
        if (!ok){
            revert SendFailed();
        }
    }

    // 比较灵活 没有gas限制，推荐
    function callETH(address payable to, uint256 amount) external payable {
        (bool ok, ) = to.call{value: amount}("");
        if (!ok){
            revert CallFailed();
        }
    }
}