// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract B {
    uint public num;
    address public sender;

    // call setVars(uint)
    // 语境(上下文)为合约C。在运行后，合约C中的状态变量将被修改：num被改为10，sender变为合约B的钱包地址。合约B中的状态变量不会被修改。
    function callSetVars(address addr, uint256 num) external payable {
        (bool ok, bytes memory data) = addr.call(
            abi.encodeWithSignature("setVars(uint256)", num)
        );
    }

    // 由于是delegatecall，语境(上下文)为合约B。在运行后，合约B中的状态变量将被修改：num被改为100，sender变为你的钱包地址。合约C中的状态变量不会被修改。
    function delegatecallSetVars(address addr, uint256 num) external payable  {
        (bool ok, bytes memory data) = addr.delegatecall(
            abi.encodeWithSignature("setVars(uint256)", num)
        );
    }
}