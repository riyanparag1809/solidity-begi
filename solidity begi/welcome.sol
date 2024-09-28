//SPDX-License-Identifier :MIT
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;//solidity version
contract SimpleStorage{
     //intialise favoriteNUmber to 0
     uint256  public favouriteNumber;
    struct Person{
      string name;
      uint256 age;

    }
    //mapping
    mapping(string=>uint256) public nameTOAge;

   Person[] public peopleList;
     
   function store(uint256 _favouriteNumber) public {
    favouriteNumber=_favouriteNumber;
   }
   function retrieve() public view returns(uint256){
    return favouriteNumber;
   }
   function addPerson(string memory _name,uint256 _age) public {
      peopleList.push(Person(_name,_age));
      //mapping code
      nameTOAge[_name]=_age;
   }  
   


   
    
     
}
//simple smart contract for finance
