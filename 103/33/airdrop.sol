// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "../31/IERC20.sol";

contract Airdrop {
    function getSum(uint256[] calldata arr) public pure returns (uint sum) {
        for (uint i = 0; i < arr.length; i++) {
            sum += arr[i];
        }
    }

    // @notice 向多个地址转账ERC20代币，使用前需要先授权
    // @param _token 转账的ERC20代币地址
    // @param _addresses 空投地址数组
    // @param _amounts 代币数量数组（每个地址的空投数量）
    function multiTransferToken(address token, address[] calldata receives, uint[] calldata amounts) external {
        // 检查：_addresses和_amounts数组的长度相等
        require(receives.length == amounts.length, "Lengths of Receives and Amounts NOT EQUAL");
        IERC20 t = IERC20(token);
        uint amountSum = getSum(amounts);
        // 检查：授权代币数量 >= 空投代币总量
        require(t.allowance(msg.sender, address(this)) >= amountSum, "Need Approve ERC20 token");

        for (uint8 i; i < receives.length; i++) {
            t.transferFrom(msg.sender, receives[i], amounts[i]);
        }
    }

    // 向多个地址转账ETH
    function multiTransferETH(
        address payable[] calldata _addresses,
        uint256[] calldata _amounts
    ) public payable {
        // 检查：_addresses和_amounts数组的长度相等
        require(_addresses.length == _amounts.length, "Lengths of Addresses and Amounts NOT EQUAL");
        uint _amountSum = getSum(_amounts); // 计算空投ETH总量
        // 检查转入ETH等于空投总量
        require(msg.value == _amountSum, "Transfer amount error");
        // for循环，利用transfer函数发送ETH
        for (uint256 i = 0; i < _addresses.length; i++) {
            _addresses[i].transfer(_amounts[i]);
        }
    }
}