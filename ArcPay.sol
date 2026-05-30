// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract ArcPay is ReentrancyGuard, Ownable(msg.sender) {
    
    event PaymentReceived(address indexed sender, uint256 amount);
    event FundsWithdrawn(address indexed owner, uint256 amount);

    // Function to receive payments
    function pay() external payable nonReentrant {
        require(msg.value > 0, "Amount must be greater than 0");
        emit PaymentReceived(msg.sender, msg.value);
    }

    // Function to withdraw funds
    function withdraw() external onlyOwner nonReentrant {
        uint256 balance = address(this).balance;
        require(balance > 0, "No funds to withdraw");
        
        emit FundsWithdrawn(msg.sender, balance);
        payable(owner()).transfer(balance);
    }
}
