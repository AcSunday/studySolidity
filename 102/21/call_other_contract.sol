// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// 调用其它合约

import "./other_contract.sol";

contract CallContract {
    function callSetX(address addr, uint256 x) external  {
        Other(addr).setX(x);
    }

    function callGetX(Other addr) external view returns(uint) {
        return addr.getX();
    }

    function callGetX2(address addr) external view returns(uint) {
        Other o = Other(addr);
        return o.getX();
    }

    function setXTransferETH(address addr, uint256 x) external payable  {
        Other(addr).setX{value: msg.value}(x);
    }
}