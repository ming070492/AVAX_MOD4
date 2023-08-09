# DEGEN Token (ERC20)

DEGEN Token is an Ethereum-based ERC20 token designed to showcase essential functionalities within the ERC20 standard. Created by Ming Manangan, this token project demonstrates minting, burning, transferring, and redemption mechanisms, providing a practical understanding of token operations on the Ethereum blockchain. The smart contract code is provided as an educational resource for developers exploring ERC20 token implementation. Please note that this project is intended for educational purposes only and should be thoroughly reviewed and tested before any deployment on a live network.

Certainly, here's the adjusted guide with Step 2 removed:

## Getting Started with DEGEN Token on Avalanche Fuji C-Chain using Hardhat

This guide will assist you in deploying and interacting with the DEGEN Token, an ERC20 token, on the Avalanche Fuji C-Chain using Hardhat. It offers a straightforward introduction to working with tokens on Avalanche's network.

### Prerequisites

1. **Metamask Wallet:** Install the Metamask browser extension and configure it for the Avalanche Fuji C-Chain.

2. **Testnet AVAX:** Obtain AVAX tokens from the Avalanche Faucet to cover transaction costs.

### Step 1: Deploy the Token

1. Clone the DEGEN Token repository and navigate to the project directory.

2. Install dependencies if needed:
   ```
   npm install
   ```

3. Update the Hardhat configuration file (`hardhat.config.js`) with your Avalanche Fuji C-Chain network details.

4. Modify the token parameters in the contract file, such as initial supply, name, and symbol.

5. Deploy the contract to Avalanche Fuji C-Chain using Hardhat:
   ```
   npx hardhat run scripts/deploy.js --network fuji
   ```

6. Note down the deployed contract address for future use.

### Step 2: Experiment and Test

1. Use the Hardhat console and Avalanche Block Explorer to experiment with different DEGEN Token actions.

2. Test minting, transferring, and burning tokens to familiarize yourself with the contract's capabilities.

Keep in mind that this guide offers a basic understanding of deploying and using an ERC20 token on the Avalanche Fuji C-Chain using Hardhat. For real-world deployment and security, further research and testing are necessary.

## Disclaimer

This guide and the provided code are for educational purposes only. Thoroughly test any smart contract before deploying it to a live blockchain network.

## Author
MingMingMing

## License
Unlicensed
