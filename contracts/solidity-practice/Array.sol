// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// Array - dynamic or fixed size
// Initialization
// Insert (push), get, update, delete, pop, length
// Creating array in memory
// Returning array from function

contract Structs {
    // Dynamic Array // 動態長度
    uint[] public nums = [1, 2, 3];
    // Fixed Array // 固定長度
    uint[3] public numsFixed = [4, 5, 6];

    function examples() external {
        // update array 
        // 新增 item 到最後
        nums.push(4); // [1, 2, 3, 4]
        // 移除最後的 item
        nums.pop(); // [1, 2, 3]
        // read array size
        uint len = nums.length;

        // read item
        uint x = nums[1]; // 2
        // update item
        nums[2] = 777; // [1, 2, 777]
        // delete item
        delete nums[1]; // [1, 0, 777] 
        // 刪除行為不會改變陣列長度
        // 被刪除的值，將變成 default 值，如 uint 的 default 是 0

        // create array in memory 
        // 注意內存中的陣列必須是固定大小，如此就不能調用 pop, push 
        uint[] memory a = new uint[](3);
        a[1] = 123; // ok
        // a.pop(); // Error
        // TypeError: Member "pop" is not available in uint256[] memory outside of storage.
        // 類型錯誤：成員“pop”在存儲之外的 uint256[] 內存中不可用
    }

    // memory 告訴 function 將狀態變量 nums 複製到內存中，然候返回它
    // 不推薦寫出返回 array 的 function，Gas 消耗太大
    function returnArray() external view returns (uint[] memory) {}
}