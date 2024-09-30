//SPDX-License-Identifier:MIT
pragma solidity ^0.8.27;
import {PriceConverter} from "./PriceConverter.sol";




contract FundMe {
    using PriceConverter for uint256;
    uint256 public fundAmounts=3e18;
    address[] Senders;
    mapping(address sender=> uint256 foundedAmount)amountToREciever;
   address owner; 
    // Constructor function
    constructor() payable  {
       
    owner=msg.sender;
        
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
   function withdraw()  public onlyOwner{
    uint256 index;
    for(index=0;index<Senders.length;index++){
        address funder=Senders[index];
        amountToREciever[funder]=0;
        Senders=new address[](0);


        payable(msg.sender).transfer(address(this).balance); // the current contract sends the Ether amount to the msg.sender

        bool success = payable(msg.sender).send(address(this).balance);
        require(success, "Send failed");

        (bool successful, ) = payable(msg.sender).call{value: address(this).balance}("");
         require(successful, "Call failed");

    }
   }
    modifier onlyOwner() {
        require(owner==msg.sender,"your not the sender");
        _;
            }
    

   
}