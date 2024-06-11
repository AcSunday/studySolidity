// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

library Strings {
    bytes16 private constant _HEX_SYMBOLS = "0123456789abcdef";

    function toString(uint256 val) public pure returns (string memory) {
        if (val == 0){
            return "0";
        }

        uint256 temp = val;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (val != 0) {
            digits -= 1;
            buffer[digits] = bytes1(48 + uint8(val % 10));
            val /= 10;
        }
        return string(buffer);
    }

    function toHexString(uint256 val) public pure returns (string memory) {
        if (val == 0){
            return "0x00";
        }
        uint256 temp = val;
        uint256 length = 0;
        while (temp != 0){
            length++;
            temp >>= 8;
        }
        return toHexString(val, length);
    }

    function toHexString(uint256 val, uint256 length) public pure returns(string memory) {
        bytes memory buffer = new bytes(2 * length + 2);
        buffer[0] = "0";
        buffer[1] = "x";
        for (uint256 i = 2 * length + 1; i > 1; --i){
            buffer[i] = _HEX_SYMBOLS[val & 0xf];
            val >>= 4;
        }
        require(val == 0, "Strings: hex length insufficient");
        return string(buffer);
    }
}