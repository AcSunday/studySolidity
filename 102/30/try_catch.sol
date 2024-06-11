// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract OnlyEven {
    constructor(uint a) {
        require(a != 0, "invalid number");
        assert(a != 1);
    }

    function onlyEven(uint256 b) external pure returns(bool ok) {
        require(b % 2 == 0, "Ups! Reverting");
        ok = true;
    }
}

contract TryCatch {
    event SuccessEvent();
    event CatchEvent(string message);
    event CatchByte(bytes data);

    OnlyEven e;

    constructor() {
        e = new OnlyEven(2);
    }

    function execute(uint n) external returns(bool ok) {
        try e.onlyEven(n) returns(bool _ok) {
            emit SuccessEvent();
            return _ok;
        } catch Error(string memory reason) {
            emit CatchEvent(reason);
        }
    }

    // 在创建新合约中使用try-catch （合约创建被视为external call）
    // executeNew(0)会失败并释放`CatchEvent`
    // executeNew(1)会失败并释放`CatchByte`
    // executeNew(2)会成功并释放`SuccessEvent`
    function executeNew(uint a) external returns(bool ok) {
        try new OnlyEven(a) returns(OnlyEven _e) {
            emit SuccessEvent();
            ok = _e.onlyEven(a);
        } catch Error(string memory reason) {
            emit CatchEvent(reason);
        } catch (bytes memory reason) {
            emit CatchByte(reason);
        }
    }
}