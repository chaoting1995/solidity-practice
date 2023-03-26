// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract IfElse {
    function example(uint _x) external pure returns (uint) {
        if (_x < 20) {
            return 1;
        } else if (_x < 20) {
            return 2;
        } else {
            return 3;
        }
        
        // 可省略最後一個 else，省略花括號
        // return 3;
    }

    function ternary(uint _x)external pure returns (uint) {
        // if(_x < 10) {
        //     return 1;
        // }
        // return 2;
        
        // 等效於上面的 code
        return _x < 10 ? 1 : 2;
    }
}