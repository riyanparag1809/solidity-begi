//SPDX-License-Identifier:MIT
pragma solidity ^0.8.27;
import {PriceConverter} from "./PriceConverter.sol";




contract FundMe {
    using PriceConverter for uint256;
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
        require(msg.value.getConversion()>= fundAmounts ,"You must send some Ether");
        //add the who sent eth
        Senders.push(msg.sender);
        amountToREciever[msg.sender]=amountToREciever[msg.sender]+msg.value;

    }
   
}