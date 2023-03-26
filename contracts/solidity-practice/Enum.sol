// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

// Data types - values and references

contract Emun {
    
    // 聲明一個 enum 發貨狀態
    // 預設值是第一個值
	enum Status {
        None,       // 0
        Pending,    // 1
        Shipped,    // 2
        Completed,  // 3
        Rejected,   // 4
        Canceled    // 5
    }

    // 用型別 enum 聲明一個狀態變量 status
    Status public status;

    // 型別 enum 與其他資料型別組合的用例
    // 自定義型別 Order
    struct Order {
        address buyer;
        Status status;
    }

    // 聲明一個 Order 陣列
    Order[] public orders;

    // why must be add `external`
    function get() external view returns (Status) {
        return status;
    }

    // input 須為 uint 正整數，即 Status 的 index
    function set(Status _status) external {
        status = _status;
    }

    // 發貨
    function ship() external {
        status = Status.Shipped;
    }

    function reset () external {
        delete status;
        // 會將 status 重置為 enum Status 的預設值 None
    }
}