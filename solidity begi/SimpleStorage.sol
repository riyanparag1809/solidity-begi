//SPDX-License-Identifier:MIT
pragma solidity ^0.8.24;
import {we2,we2,welcome} from "./welcome.sol";
contract SimpleStorage{
    //initialising variable
        welcome[] public  justWelcome;

    function createSimpleStorage() public{
        welcome newWelcome=new welcome();
        justWelcome.push(newWelcome);
        
    }
     function sfStore(uint256 _storageIndex, uint256 _storageNumber) public {
        welcome newWelcome =justWelcome[_storageIndex]; // assuming welcome is a struct
       newWelcome.store(_storageNumber);
    }
    function sfGet(uint256 _storageIndex) public view returns(uint256){
        
        return justWelcome[_storageIndex].retrieve();
    } 
}