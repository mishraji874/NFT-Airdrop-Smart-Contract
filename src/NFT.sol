// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
import "@openzeppelin/contracts/utils/Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFT is ERC721, ERC721URIStorage, ERC721Burnable, Pausable, Ownable {
    uint256 private _nextTokenId;
    string private _baseTokenURI;

    mapping(address => bool) public whitelist;
    mapping(address => bool) public hasClaimed;

    constructor(address initialOwner, address[] memory initialWhitelist, string memory baseTokenURI) ERC721("NFT", "NFT") Ownable (initialOwner) {
        transferOwnership(initialOwner);
        addToWhitelist(initialWhitelist);
        _baseTokenURI = baseTokenURI;
    }

    function claimNFT() public whenNotPaused {
        address to = msg.sender;
        require(whitelist[to], "caller is not whitelisted");
        require(!hasClaimed[to], "caller has already claimed an NFT");

        uint256 tokenId = _nextTokenId++;
        _safeMint(to, tokenId);
        hasClaimed[to] = true;
    }

    function addToWhitelist(address[] memory addresses) public onlyOwner {
        for(uint i = 0; i < addresses.length; i++) {
            if(!whitelist[addresses[i]]) {
                whitelist[addresses[i]] = true;
            }
        }
    }

    function removeFromWhitelist(address[] memory addresses) public onlyOwner {
        for(uint i = 0; i < addresses.length; i++) {
            if(whitelist[addresses[i]]) {
                whitelist[addresses[i]] = false;
            }
        }
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function tokenURI(uint256 tokenId) public view override(ERC721, ERC721URIStorage) whenNotPaused returns (string memory) {
        return super.tokenURI(tokenId);
    }

    function supportsInterface(bytes4 interfaceId) public view override(ERC721, ERC721URIStorage) returns (bool) {
        return super.supportsInterface(interfaceId);
    }
}