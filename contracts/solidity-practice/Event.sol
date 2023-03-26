// SPDX-License-Identifier: MIT
pragma solidity ^0.8.3;

// 事件允許在區塊鏈上寫入資料
// 事件寫入的資料，無法通過智能合約檢索(retrieve)
// 事件的主要目的是記錄發生的事情
// 如果希望一次性保存資料在鏈上，無需合約檢索它，可以作為將資料存儲為狀態變量的一種廉價替代方法

contract Event {
    // 聲明一個 event，定義要紀錄的資料型別
    event Log(string message, uint256 val);
    // 定義傳入參數時，用關鍵字 indexed，可以通過「記錄的參數」搜索「特定事件」
    // 設定 indexed 的上限是 3 個參數
    event IndexedLog(address indexed sender, uint256 val);

    function example() external {
        // 聲明一個 emit 函式，並傳入要記錄的資料
        // 當函式 example 執行 emit Log()，就能觸發 event Log，將資料保存上鏈(storing new data onto the blockchain)
        // 注意：該處聲明的不是 readonly function，是一個 transactional function
        emit Log("foo", 1234);
        emit IndexedLog(msg.sender, 789);
    }

    // 聲明參數 address 為indexed，以便搜索發件人
    event Message(address indexed _from, address indexed _to, string messsage);

    // 建立函式 sendMessageString 
    // message 是動態型別，因此聲明為 calldata (??)
    function sendMessage(address _to, string calldata message) external {
        emit Message(msg.sender, _to, message);
    }
}
