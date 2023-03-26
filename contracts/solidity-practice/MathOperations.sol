pragma solidity ^0.4.19;

contract ZombieFactory {

    uint dnaDigits = 16;
    uint public dnaModulus1 = 10^dnaDigits;
    uint public dnaModulus2 = 10**dnaDigits;
    // 这里开始
}

pragma solidity ^0.4.19;

contract ZombieFactory1 {

    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    }

    Zombie[] public zombies;

    function _createZombie(string _name, uint _dna) private {
        zombies.push(Zombie(_name, _dna));
    }

    function _generateRandomDna(string _str) private view returns (uint) {
        uint rand = uint(keccak256(abi.encodePacked(_str)));
        return rand % dnaModulus + 1;
    }

}
