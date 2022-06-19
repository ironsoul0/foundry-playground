// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.10;

import "forge-std/Test.sol";

import "../src/BITToken.sol";
import "../src/BrainNFT.sol";

contract BrainNFTTest is Test {
    using stdStorage for StdStorage;

    BrainNFT private nft;

    function testClaimNFT() public {
        BITToken bitToken = new BITToken(1 ether);
        nft = new BrainNFT(address(bitToken), "");
        vm.expectRevert(abi.encodeWithSignature("NoAccess()"));
        nft.claimNFT(1);
    }

    function testInvalidIndex() public {
        BITToken bitToken = new BITToken(1 ether);
        nft = new BrainNFT(address(bitToken), "");
        bitToken.setBurner(address(nft));

        vm.expectRevert("INVALID_NFT_INDEX");
        nft.claimNFT(0);
    }

    function testOnlyOwner() public {
        BITToken bitToken = new BITToken(1 ether);
        nft = new BrainNFT(address(bitToken), "");
        vm.prank(address(nft));

        vm.expectRevert("OWNER_ONLY");
        bitToken.setBurner(address(nft));
    }
}
