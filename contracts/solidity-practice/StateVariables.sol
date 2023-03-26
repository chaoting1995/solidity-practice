// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract StateVariables {
    // 狀態變量
    // 聲明在 contract 內、function 外
    // 資料被保存在鏈上
    uint public myUint = 123;

    function foo() external pure {
        // 局部變量
        // 聲明在 function 內
        // 當 funciton 執行時，變量才存在
        // 當 funciton 執行完，變量就消失
        uint notStateVariable = 456;
    }
}