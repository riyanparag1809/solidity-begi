
// pragma solidity ^0.6.7;

// contract SAfeMath{
    // uint8  public raju=255;
    // function add(uint8 _raju) public {
        // raju=_raju;
        // raju+=1;

    // }
// }
//after 255 its refers 0 this was unchecked at that time 
//  SPDX-License-Identifier: MIT
 pragma solidity ^0.8.27;

 contract SAfeMath{
    uint8  public raju=255;
    function add(uint8 _raju) public {
         raju=_raju;
        unchecked{raju+=1;}

    }
}