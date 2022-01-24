// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.0;

// smart contract that allows end user the link(?) to download my resume
// if they pay some test ether
contract AskResume {

// owner of contract receives the pay
  address payable public owner;

// _requester is requester, _spent confirms how much requester spent
  event Requested(address _requester, uint _spent);

// constructor is called only when contract is first deployed
  constructor() {
      owner = payable(msg.sender);
  }

// check that payment of wei is sufficient for purchase
  modifier costs(uint _amount) {
      require(msg.value >= _amount, "Error: purchase costs .0001 ether.");
      _;
  }

// receive payment(msg.value) from msg.sender
  receive() external payable costs(.0001 ether) {
      owner.transfer(msg.value);
      emit Requested(msg.sender, msg.value);
  }
}