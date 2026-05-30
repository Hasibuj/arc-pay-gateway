// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

// Using official GitHub raw paths to avoid dependency resolution errors
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/ReentrancyGuard.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract ArcPay is ReentrancyGuard, Ownable {
    
    event PaymentReceived(address indexed sender, uint256 amount);
    event FundsWithdrawn(address indexed owner, uint256 amount);

    constructor() Ownable(msg.sender) {}

    function pay() external payable nonReentrant {
        require(msg.value > 0, "Amount must be greater than 0");
        emit PaymentReceived(msg.sender, msg.value);
    }

    function withdraw() external onlyOwner nonReentrant {
        uint256 balance = address(this).balance;
        require(balance > 0, "No funds to withdraw");
        
        emit FundsWithdrawn(msg.sender, balance);
        payable(owner()).transfer(balance);
    }
}
