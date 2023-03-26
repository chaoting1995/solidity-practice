// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Counter {
    uint256 public count;

    function increment() public payable {
        require(msg.value == 0.001 ether, "Please send 0.001 ETH to increment the counter");
        count++;
    }
}
