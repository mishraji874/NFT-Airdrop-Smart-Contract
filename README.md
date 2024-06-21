# Secure and Efficient NFT Airdrop Smart Contract
This smart contract facilitates secure and efficient NFT airdrops on a blockchain network. It allows project owners to distribute NFTs to a designated list of recipients in a transparent and verifiable manner.

## Features:

- **Airdrop Functionality:** Distribute NFTs to a list of wallet addresses specified by the contract owner.
- **Security:** Leverage blockchain technology to ensure tamper-proof airdrops and prevent unauthorized access.
- **Transparency:** Recipients can verify the airdrop process and confirm their eligibility.
- **Flexibility:** Optionally configure requirements for claiming NFTs (e.g., holding a specific token).

## Getting Started:

### Installation and Deployment

1. Clone the repository:
   ```bash
   git clone https://github.com/mishraji874/NFT-Airdrop-Smart-Contract.git
2. Navigate to the project directory:
    ```bash
    cd NFT-Airdrop-Smart-Contract
3. Initialize Foundry and Forge:
    ```bash
    forge init
4. Create the ```.env``` file and paste the [Alchemy](https://www.alchemy.com/) api for the Sepolia Testnet and your Private Key from the Metamask.

5. Compile and deploy the smart contracts:

    First deploy the NFT contract on the blockchain and then airdrop it.
    ```bash
    forge create NFT --rpc-url $RPC_URL --private-key $PRIVATE_KEY--constructor-args "{INITIAL_OWNER_ADDRESS}" "[0xAddr1, 0xAddr2, 0xAddr3]" "IPFS_NFT_LINK"
    ```
    After deploying the NFT then we have to claim the NFT.
    Don't forget to add a same address in the waitinglist and also be sure to claim the NFt with that address only.
    ```bash
    forge script script/Claim.s.sol --rpc-url $RPC_URL --private-key $PRIVATE_KEY --broadcast
    ```
### Running Tests

Run the automated tests for the smart contract:

```bash
forge test
```

## Configuration:

- The contract can be configured with:
    - The address of the NFT contract being airdropped.
    - The list of recipient addresses.
    - (Optional) Claiming requirements (e.g., holding a specific token).
- The contract owner can initiate the airdrop process once configured.

## Additional Notes:

- This is a basic implementation and can be extended to include features like:
    - Merkle tree integration for efficient verification of large recipient lists.
    - Staged airdrops with predefined release schedules.
- Refer to the NFT.sol and NFTTest.t.sol files for detailed contract logic and test cases.

## Security Considerations:

- Smart contract audits by reputable security firms are highly recommended.
- Carefully review access control mechanisms to ensure only authorized users can initiate airdrops.

This NFT airdrop smart contract provides a secure and efficient solution for distributing your NFTs to a targeted audience.