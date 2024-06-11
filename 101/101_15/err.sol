// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

error SetNotOwner(); // 自定义error
// error TransferNotOwner(address sender); // 自定义的带参数的error

contract ErrTest {
    address public owner;

    constructor(){
        owner = msg.sender;
    }

    // 推荐error，节省gas
    function setNewOwner(address addr) public {
        if(owner != msg.sender) {
            revert SetNotOwner();
        }

        owner = addr;
    }

    function setNewOwner1(address addr) public {
        require(owner == msg.sender, "Set new owner failed, current not is owner");

        owner = addr;
    }

    function setNewOwner2(address addr) public {
        assert(owner == msg.sender);

        owner = addr;
    }
}