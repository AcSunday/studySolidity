// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// erc20 标准合约

import "./IERC20.sol";

contract ERC20 is IERC20 {
    address public owner;
    mapping(address => uint256) public override balanceOf;
    mapping(address => mapping(address => uint256)) public override allowance;
    uint256 public override totalSupply;

    string public name;         // token名称
    string public symbol;       // 代号
    uint8 public decimals = 18; // 小数位数

    modifier checkBalance(address from, uint amount) {
        require(balanceOf[from] >= amount, "Insufficient balance");
        _;
    }

    modifier checkAllowance(address from, address to, uint amount) {
        require(allowance[from][to] >= amount, "Insufficient allowance balance");
        _;
    }

    constructor(string memory _name, string memory _symbol) {
        owner = msg.sender;
        name = _name;
        symbol = _symbol;
    }

    function _transfer(address from, address to, uint amount) internal checkBalance(from, amount) returns (bool) {
        balanceOf[from] -= amount;
        balanceOf[to] += amount;
        emit Transfer(from, to, amount);
        return true;
    }

    function transfer(address to, uint amount) external override returns (bool) {
        return _transfer(msg.sender, to, amount);
    }

    function approve(address spender, uint amount) external override returns (bool) {
        allowance[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function transferFrom(address from, address to, uint amount) external override checkAllowance(from, msg.sender, amount) returns (bool) {
        allowance[from][msg.sender] -= amount;
        return _transfer(from, to, amount);
    }

    function mint(uint amount) external {
        balanceOf[msg.sender] += amount;
        totalSupply += amount;
        emit Transfer(address(0), msg.sender, amount);
    }

    function burn(uint amount) external {
        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;
        emit Transfer(msg.sender, address(0), amount);
    }
}