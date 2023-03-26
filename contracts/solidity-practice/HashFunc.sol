// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

// keccak256
// 用於簽署一個帶有唯一id的簽名
// 用於創建一個受前端保護的合約

contract HashFunc {
    // keccak256 hash func 的 output 型別是 bytes32
    // keccak256 hash func 的 input 型別是 bytes，所以傳入值要先轉換成 bytes
    // 這裡用 abi.encodePacked 將傳入值轉成 bytes

    function hash(string memory text, uint num, address addr) external pure returns (bytes32) {
        return keccak256(abi.encodePacked(text, num, addr));
    }

    // input
    // “AAA”,123,0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
    // output
    // 0: bytes32: 0x1e1ed14a153b8cb0ae23fda8d67aff258c0041a71f9640fddc86f735284235f2
    // -------------------------------------
    
    // input
    // “AAB”,123,0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
    // output
    // 0: bytes32: 0x6842e9fabdda6eb782b609640f015f3e123c562a9dbd24afff3eb46752d86a5f
    // -------------------------------------
    
    // input
    // “AAA”,123,0x5B38Da6a701c568545dCfcB03FcB875f56beddC5
    // output
    /*
    call to HashFunc.hash errored: 
    Error encoding arguments: 
    Error: bad address checksum (argument="address", value="0x5B38Da6a701c568545dCfcB03FcB875f56beddC5", code=INVALID_ARGUMENT, version=address/5.5.0) (argument=null, value="0x5B38Da6a701c568545dCfcB03FcB875f56beddC5", code=INVALID_ARGUMENT, version=abi/5.5.0)
    */
    // 代表地址參數的校驗和無效
    // 校驗和是一種驗證地址是否有效的機制，防止用戶意外將ETH發送到無效地址

    // -------------------------------------
    // -------------------------------------

    // abi.encode & abi.encodePacked 的差異
    // hash collision (衝突): 不同輸入，但 hash 到相同輸出
    // abi.encode 將資料編譯成 bytes(字節)
    // abi.encodePacked 將資料編譯成 bytes，且壓縮，輸出會更小

    function encode(string memory text0, string memory text1) external pure returns(bytes memory) {
        return abi.encode(text0, text1);
    }
    
    function encodePacked(string memory text0, string memory text1) external pure returns(bytes memory) {
        return abi.encodePacked(text0, text1);
    }

    // 上述兩種函式，可嘗試傳入 "AAA","BBB" 
    // encodePacked 的 output 小很多
    // -------------------------------------
    
    // hash collision (衝突): 不同輸入，但 hash 到相同輸出
    // abi.encodePacked 
    // input 
    // ("AAAA","BBB") 與 ("AAA","ABBB") 
    // output 輸出相同
    // 0: bytes: 0x41414141424242
    
    // 同理，以下 hash func 將回傳相同值
    function collision(string memory text0, string memory text1) external pure returns(bytes32) {
        return keccak256(abi.encodePacked(text0, text1));
    }

    // 修復方法一：改為使用 abi.encode
    // 缺點是回傳值未被壓縮，size 較大

    // 修復方法二：增加傳入參數，以斷開相鄰的傳入組合
    function collisionFixed(string memory text0, uint x, string memory text1) external pure returns(bytes32) {
        return keccak256(abi.encodePacked(text0, x, text1));
    }
}

