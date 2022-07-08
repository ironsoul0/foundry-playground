// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.10;

struct Item {
    uint256 value;
    uint256 updateCount;
}

contract Playground {
    mapping(address => Item) public items;
    uint256 public VALUE;

    constructor(uint256 deploy) {
        VALUE = deploy;
    }

    function getValue() public view returns (uint256) {
        return VALUE;
    }

    function updateValue() public {
        VALUE += 1;
    }

    function accessItem() public {
        increaseItem(items[msg.sender]);
    }

    function increaseItem(Item storage item) private {
        item.value += 1;
    }
}
