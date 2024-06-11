// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Store{
    uint[] public x = [1,2,3];
    
    function fCalldata(uint[] calldata x) public pure returns(uint[] calldata) {
        // 参数作为calldata数组，不能被修改
        // x[0] = 0; // 这样修改会报错
        return (x);
    }

    function fStorage() public  {
        // 声明一个storage的变量 y，指向x。修改y也会影响x
        uint[] storage y = x;
        y[0] = 100;
    }

    function fMemory() public view  {
        // 声明一个memory变量y，复制x。修改y不会影响x
        uint[] memory y = x;
        y[0] = 123;
        uint[] memory y1 = x;
        y1[0] = 456;
    }

    function global() external view returns(address, uint, bytes memory){
        address sender = msg.sender;
        uint blockNum = block.number;
        bytes memory data = msg.data;
        return(sender, blockNum, data);
    }
}