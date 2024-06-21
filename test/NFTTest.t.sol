// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Test, console} from "forge-std/Test.sol";
import {NFT} from "../src/NFT.sol";

contract NFTTest is Test {
    NFT nft;
    address owner;
    address[] initialWhitelist;

    function setUp() public {
        owner = address(this);
        initialWhitelist = [vm.addr(1), vm.addr(2), vm.addr(3), vm.addr(4)];
        nft = new NFT(owner, initialWhitelist, "http://api.example.com/");
        nft.transferOwnership(owner);
    }

    function testClaimNFT() public {
        vm.startPrank(vm.addr(1));
        nft.claimNFT();
        assertTrue(nft.balanceOf(vm.addr(1)) == 1, "should have minted 1 NFT");
        vm.stopPrank();
    }

    function testFailClaimNFTNotWhitelisted() public {
        vm.startPrank(vm.addr(5));
        nft.claimNFT();
        vm.stopPrank();
    }

    function testFailClaimNFTTwice() public {
        vm.startPrank(vm.addr(1));
        nft.claimNFT();
        nft.claimNFT();
        vm.stopPrank();
    }

    function testPauseunpause() public {
        nft.pause();
        assertTrue(nft.paused(), "contract should be paused");

        nft.unpause();
        assertFalse(nft.paused(), "contract should be unpaused");
    }
}