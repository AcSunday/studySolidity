// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract MapTyp {
    // Diy struct
    struct Student {
        uint256 id;
        uint256 score;
    }

    // 使用diy结构体作为map key会报错
    // mapping(Student => uint) public testVar;

    mapping(uint => address) public idToAddr;

    function store(uint key, address val) public  {
        idToAddr[key] = val;
    }
}