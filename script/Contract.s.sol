// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "forge-std/Test.sol";

import "../src/BITToken.sol";
import "../src/BrainNFT.sol";

contract ContractScript is Script, Test {
    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        BITToken token = new BITToken(0);
        BrainNFT nft = new BrainNFT(address(token), "");
        emit log_named_address("ERC20 address:", address(token));
        emit log_named_address("NFT address:", address(nft));

        vm.stopBroadcast();
    }
}
