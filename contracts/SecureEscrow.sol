// SPDX-License-Identifier: MIT
pragma solidity 0.6.12;

contract SecureEscrow {

    address payable public buyer;
    address payable public seller;
    address payable public arbiter;
    uint256 public depositAmount;
    bool public isSettled;

    constructor(address payable _seller, address payable _arbiter) public payable {
        require(msg.value > 0, "Deposit required");
        buyer = msg.sender;
        seller = _seller;
        arbiter = _arbiter;
        depositAmount = msg.value;
        isSettled = false;
    }

    function release() external {
        require(msg.sender == arbiter, "Not arbiter");
        require(!isSettled, "Already settled");
        isSettled = true;
        uint256 total = address(this).balance;
        uint256 fee = total / 100;
        uint256 payment = total - fee;
        seller.transfer(payment);
        arbiter.transfer(fee);
    }

    function refund() external {
        require(msg.sender == arbiter, "Not arbiter");
        require(!isSettled, "Already settled");
        isSettled = true;
        buyer.transfer(address(this).balance);
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
