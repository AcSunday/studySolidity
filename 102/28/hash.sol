// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract HashCalc {

    // 生成数据唯一标识
    function hash(uint n, string memory s, address addr) public pure returns (bytes32) {
        return keccak256(abi.encodePacked(n, s, addr));
    }

    // 弱抗碰撞性
    function weak(string memory s) public pure returns (bool) {
        return keccak256(abi.encodePacked(s)) == keccak256(abi.encodePacked("0xAA"));
    }

    // 强抗碰撞性
    function strong(
        string memory string1,
        string memory string2
    )public pure returns (bool){
        return keccak256(abi.encodePacked(string1)) == keccak256(abi.encodePacked(string2));
    }
}