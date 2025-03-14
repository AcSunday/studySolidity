// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract FuncReload {
    function saySomething() public pure returns(string memory) {
        return ("Nothing");
    }

    function saySomething(string memory something) public pure returns(string memory){
        return(something);
    }

    function f(uint8 _in) public pure returns (uint8 out) {
        out = _in;
    }

    function f(uint256 _in) public pure returns (uint256 out) {
        out = _in;
    }

    function callF(uint256 _in) public pure returns(uint256 out) {
        return f(_in);
    }
}