//SPDX-License-Identifier:MIT
pragma solidity ^0.8.27;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

contract FundMe {
    uint256 public fundAmounts;

    constructor() payable  {
        // Initialize fundAmounts to 3
        fundAmounts = 3;
    }

    function fundMe() public payable {
        // Increment fundAmounts by 2
        uint256 priceOfThat=9;
         priceOfThat+= 2;

        // Require that the sender sends some Ether
        require(msg.value >= fundAmounts ,"You must send some Ether");
    }
}