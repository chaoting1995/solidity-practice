// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

// Return multiple outputs
// Named outputs
// Destructuring Assignment 解構賦值

contract FunctionOutputs {
    // 回傳多個變量
    function returnMany() public pure returns (uint, bool) {
        return (1, true);
    }

    // 可以為 output 命名
    function named() public pure returns (uint x, bool b) {
        return (1, true);
    }

    // 為 output 命名後，可以實現隱式返回(implicitly return)
    // 能節省一點 gas
    function assigned() public pure returns (uint x, bool b) {
        x = 1;
        b = true;
    }

    function destructuringAssignments() public pure {
        (uint x, bool b) = returnMany();
        // 不需要第一個變量，可刪除來省略他，僅保留「,」
        (, bool _b) = returnMany();

    }
}
