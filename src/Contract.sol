// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Contract {
    address public owner;

    constructor(address[] memory users) {
        owner = users[0];
    }
}
