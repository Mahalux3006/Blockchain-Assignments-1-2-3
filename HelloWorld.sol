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

contract ProjectFunding {
    mapping(uint256 => uint256) public projectFunding;
    mapping(uint256 => uint256) public projectCost;

    // Function to set the cost of a project
    function setProjectCost(uint256 projectId, uint256 cost) external {
        projectCost[projectId] = cost;
    }

    // Function to fund a project
    function fundProject(uint256 projectId, uint256 amount) external payable {
        require(amount > 0, "Amount must be greater than zero");
        projectFunding[projectId] += amount;
    }

    // Function to calculate remaining funding required for a project
    function remainingFundingRequired(uint256 projectId) external view returns (uint256) {
        require(projectCost[projectId] > 0, "Project cost not set");
        uint256 remainingAmount = 0;
        if (projectFunding[projectId] < projectCost[projectId]) {
            remainingAmount = projectCost[projectId] - projectFunding[projectId];
        }
        return remainingAmount;
    }
}
