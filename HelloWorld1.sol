// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract HelloWorld {
  /**
   * @dev Prints Hello World string
   */
  function print() public pure returns (string memory) {
    return "Hello World!";
  }
}
pragma solidity ^0.8.0;

contract FundingProject {
    address public owner;
    uint public fundingGoal;
    uint public currentFunding;
    address public lastFunder;

    constructor(uint _fundingGoal) {
        owner = msg.sender;
        fundingGoal = _fundingGoal;
    }

    function fundProject() public payable {
        require(currentFunding + msg.value <= fundingGoal, "Funding goal reached");

        currentFunding += msg.value;
        lastFunder = msg.sender;
    }

    function withdrawExcessFunds() public {
        require(msg.sender == owner, "Only the owner can withdraw excess funds");
        require(currentFunding > fundingGoal, "No excess funds to withdraw");

        uint excessFunds = currentFunding - fundingGoal;
        payable(lastFunder).transfer(excessFunds);
        currentFunding = fundingGoal; // Set current funding back to the funding goal
    }
}
