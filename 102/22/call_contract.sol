// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Call {
    event Response(bool success, bytes data);

    function callSetX(address payable addr, uint256 x) public payable  {
        (bool success, bytes memory data) = addr.call{value: msg.value}(
            abi.encodeWithSignature("setX(uint256)", x) // 参数1 函数名+参数类型，参数2 调用目标函数所需的参数
        );

        emit Response(success, data);
    }

    function callGetX(address addr) external returns(uint256) {
        (bool success, bytes memory data) = addr.call(
            abi.encodeWithSignature("getX()")
        );

        emit Response(success, data);
        return abi.decode(data, (uint256)); // 参数2是类型断言
    }

    // call仍能执行成功，并返回success，但其实调用的目标合约fallback函数。
    function callNotExsit(address addr) external  {
        (bool success, bytes memory data) = addr.call(
            abi.encodeWithSignature("foo()")
        );

        emit Response(success, data);
    }
}