// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract FunctionIntro {
    function add(uint x, uint y) external pure returns(uint) {
        return x + y;
    }
 
    function sub(uint x, uint y) external pure returns(uint) {
        return x - y;
    }
}

// external，當前合約、子合約不可調用，僅外部合約可調用

// TypeError: Data location can only be specified for array, struct or mapping types, but "memory" was given.
/*
    function add(uint x, uint y) external pure returns(uint) {
        uint memory result = x + y;  // <--- TypeError
        return result;
    }
*/

// pure: 對 Contract 內的 State 不查看，不修改
// 適用於數學運算或純函數
