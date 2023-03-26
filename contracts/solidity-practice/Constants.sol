// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Constants {
    // 聲明狀態變量為常數，當調用的函式，使用該常數時，能節省 Gas
    // 命名慣例：全大寫
     address public constant MY_ADDRESS = 0x4F0d1E422Bec05432c6779717D6Ed7Ce52E33706;
    // execution cost 378 gas 

     uint public constant MY_UINT = 123;
}

contract Var {
    address public MY_ADDRESS = 0x4F0d1E422Bec05432c6779717D6Ed7Ce52E33706;
    // execution cost 2489 gas
}