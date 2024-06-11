// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

struct Student{
    uint256 id;
    uint256 score;
}

contract Arr {
    Student public stu;

    function foo() public pure  {
        // g([1,2,3]); // 会报错，默认使用单位的最小类型，后面的元素也会跟着第一个使用一致的类型
        g([uint(1),2,3]);
    }

    function g(uint[3] memory) public pure  {
        /// ...

        // 如果创建的是动态数组，你需要一个一个元素的赋值
        uint[] memory x = new uint[](3);
        x[0] = 1;
        x[1] = 2;
        x[2] = 3;
    }

    function initStudnet() external  {
        Student storage stu1 = stu;
        stu1.id = 17;
        stu1.score = 100;
    }

    function initStu() external  {
        stu.id = 7;
        stu.score = 100;
    }

}