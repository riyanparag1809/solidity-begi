//SPDX-License-Identifier:MIT
pragma solidity ^0.8.24;
    import {welcome} from "./welcome.sol"

    contract SimpleStorageFactory is welcome {
    
        function store(uint256 _newNumber) public{
        number = _newNumber+5;
        }
    }