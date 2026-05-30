# arc-pay-gateway# ArcPay Gateway

ArcPay is a decentralized payment gateway smart contract built on the EVM-compatible network. It allows users to send payments to the contract and enables the owner to securely withdraw the accumulated funds.

## Features
- **Secure Payments:** Users can send native tokens to the contract.
- **Ownership Control:** Only the contract owner can withdraw the funds.
- **Reentrancy Protection:** Built with OpenZeppelin's `ReentrancyGuard` to prevent reentrancy attacks.
- **Event Logging:** Emits events for every payment received and withdrawal made for easy tracking.

## Smart Contract Details
- **Compiler Version:** 0.8.20
- **Network:** EVM Compatible (Arc Network Testnet)
- **Dependencies:** - [OpenZeppelin ReentrancyGuard](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/ReentrancyGuard.sol)
  - [OpenZeppelin Ownable](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol)

## Functions
- `pay()`: Allows users to send native tokens to the contract.
- `withdraw()`: Allows the owner to withdraw the entire balance of the contract.

## Deployment
This contract is deployed and verified on the Arc Network.
- **Contract Address:** `0xf7DA8C71538cCd841343b47F0FAf7236Fda1b14e`

## License
This project is licensed under the MIT License.
