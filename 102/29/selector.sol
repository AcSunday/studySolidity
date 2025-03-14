// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract Selector {
    event Log(bytes data);

    function mint(address to) external {
        emit Log(msg.data);
    }

    function mintSelector() external pure returns(bytes4) {
        return bytes4(keccak256("mint(address)"));
    }

    function callWithSignature() external returns(bool, bytes memory) {
        (bool ok, bytes memory data) = address(this).call(
            abi.encodeWithSelector(0x6a627842, 0x2c44b726ADF1963cA47Af88B284C06f30380fC78)
        );
        return (ok, data);
    }
}