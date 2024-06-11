// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import {Yeye} from "wtfSolidity/101/101_13/inheritance.sol";

// 通过网址引用
import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Address.sol';

contract Baba is Yeye {
    // function say() external pure override returns(string memory) {
    //     return "Baba";
    // }

    function learnYeyeSay() external pure returns (string memory) {
        return "Baba";
    }
}

contract Import {
    using Address for address;
    Yeye yeye = new Yeye();

    function test() external  {
        yeye.hip();
    }
}