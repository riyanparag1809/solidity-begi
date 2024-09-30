//SPDX-License-Identifier:MIT
pragma solidity ^0.8.27;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";




contract FundMe {
    uint256 public fundAmounts;
    address[] Senders;
    mapping(address sender=> uint256 foundedAmount)amountToREciever;
    // Constructor function
    constructor() payable  {
        // Initialize fundAmounts to 3
        fundAmounts = 3e18;
    }

    function fundMe() public payable {
        // Increment fundAmounts by 2
        uint256 priceOfThat=9;
         priceOfThat+= 2;

        // Require that the sender sends some Ether
        require(msg.value >= fundAmounts ,"You must send some Ether");
        //add the who sent eth
        Senders.push(msg.sender);
        amountToREciever[msg.sender]=amountToREciever[msg.sender]+msg.value;

    }
    function getPrice() public view returns (uint256 Price) {
        // address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        // AbI
        AggregatorV3Interface priceFeed=AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
       (,int256 price, , ,) = priceFeed.latestRoundData();
       // converting eth to usd 
        return uint256(price * 1e10);
        
    }
     function getConversion(uint256 ethAmount) public view returns(uint256) {
        uint256 ethAmountUSD;
        //get the conversion 
       return ethAmountUSD=ethAmount*getPrice()/1e18;
     }
     function getVersion() public view {
        // Get the version of the Chainlink VRF Coordinator
         // AbI
         AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
         priceFeed.version();
     }
}