// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.10;

import "forge-std/Test.sol";
import "forge-std/console.sol";

import "../src/Playground.sol";

contract PlaygroundTest is Test {
    using stdStorage for StdStorage;

    function testDeployment() public {
        Playground plg = new Playground(0);
        assertEq(0, plg.getValue());
    }

    function testUpdateValue() public {
        Playground plg = new Playground(0);
        plg.updateValue();
        assertEq(1, plg.getValue());
    }

    function testGetItem() public {
        Playground plg = new Playground(0);
        address user = address(0x1);
        vm.startPrank(user);

        plg.accessItem();
        (uint256 value, uint256 updateCount) = plg.items(user);
        assertEq(1, value);
        assertEq(0, updateCount);

        vm.stopPrank();
    }
}
