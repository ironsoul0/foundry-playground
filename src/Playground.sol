// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.10;

contract Playground {
    uint256 public VALUE = 1337;

    constructor(uint256 deploy) {
        VALUE = deploy;
    }

    function getValue() public view returns (uint256) {
        return VALUE;
    }

    function updateValue() public {
        VALUE += 1;
    }
}
