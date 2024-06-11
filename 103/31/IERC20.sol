// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

interface IERC20 {
    // @dev 释放条件：当 `value` 单位的货币从账户 (`from`) 转账到另一账户 (`to`)时.
    event Transfer(address indexed from, address indexed to, uint256 value);

    // @dev 释放条件：当 `value` 单位的货币从账户 (`owner`) 授权给另一账户 (`spender`)时.
    event Approval(address indexed owner, address indexed spender, uint256 value);

    // 返回token总供给
    function totalSupply() external view returns (uint256);
    // 返回account所持有token数量
    function balanceOf(address account) external view returns (uint256);
    // 从调用者转账token到to地址 amount数量
    function transfer(address to, uint256 amount) external returns (bool);
    // 返回owner授权给spender账户的token额度，默认0
    function allowance(address owner,address spender) external view returns (uint256);
    // 调用者授权给spender   amount数量token
    function approve(address spender, uint256 amount) external returns (bool);
    // 通过授权机制，从`from`账户向`to`账户转账`amount`数量代币。转账的部分会从调用者的`allowance`中扣除。
    function transferFrom(address from, address to, uint256 amount) external returns (bool);
}