// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Script, console} from "forge-std/Script.sol";
import {NFT} from "../src/NFT.sol";

contract Claim is Script {
    NFT public nft;

    function setUp() public {
        // Initialize NFT contract interface with the deployed contract address
        nft = NFT(0x2D3C2E32A2AB16884AB39572B257A822F26B55D1);
    }

    function run() public returns (NFT) {
        vm.startBroadcast();
        nft.claimNFT();
        vm.stopBroadcast();
        return nft;
    }
}