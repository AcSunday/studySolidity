// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

// CREATE2让我们可以在部署合约前确定它的合约地址，这也是 一些layer2项目的基础

import "./pair.sol";

contract PairFactory {
    mapping (address => mapping (address => address)) public getPair;
    address[] public allPairs;

    function create2Pair(address tokenA, address tokenB) external returns(address pairAddr) {
        require(tokenA != tokenB, "IDENTICAL_ADDRESSES"); // 避免A B token重复

        // 用tokenA和tokenB地址计算salt
        (address t0, address t1) = tokenA < tokenB ? (tokenA, tokenB) : (tokenB, tokenA); // 按大小排序
        bytes32 salt = keccak256(abi.encodePacked(t0, t1));
        // 用create2部署新合约
        // CREATE2的用法和之前讲的Create类似，同样是new一个合约，并传入新合约构造函数所需的参数，只不过要多传一个salt参数
        Pair p = new Pair{salt: salt}();
        p.initialize(tokenA, tokenB);
        pairAddr = address(p);
        allPairs.push(pairAddr);
        getPair[tokenA][tokenB] = pairAddr;
        getPair[tokenB][tokenA] = pairAddr;
    }

    // 提前计算pair合约地址
    function calculateAddr(address tokenA, address tokenB) public view returns(address predictedAddress){
        require(tokenA != tokenB, 'IDENTICAL_ADDRESSES'); //避免tokenA和tokenB相同产生的冲突
        // 计算用tokenA和tokenB地址计算salt
        (address token0, address token1) = tokenA < tokenB ? (tokenA, tokenB) : (tokenB, tokenA); //将tokenA和tokenB按大小排序
        bytes32 salt = keccak256(abi.encodePacked(token0, token1));
        // 计算合约地址方法 hash()
        predictedAddress = address(uint160(uint(keccak256(abi.encodePacked(
            bytes1(0xff),
            address(this),
            salt,
            keccak256(type(Pair).creationCode)
        ))
        )));
    }
}