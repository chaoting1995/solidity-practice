// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract GlobalVariables {
    // Global Variables 儲存資料，如：戀上交易、調用函式的帳戶
    // view function 可以從狀態變量和全局變量中讀取資料
    // 返回儲存在全局變量中的值
    function globalVars() external view returns(address, uint, uint) {
        // 儲存調用該函式的地址
        // 如：0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
        address sender = msg.sender;
        
        // 儲存調用該函式時的 unix timestamp
        // 如：1679706041
        uint timestamp = block.timestamp;
        
        // 儲存當前 block 的 number
        // 如：6
        uint blockNum = block.number;

        return (sender, timestamp, blockNum);
    }
}