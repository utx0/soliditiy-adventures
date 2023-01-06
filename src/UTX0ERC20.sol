pragma solidity ^0.8.0;

import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract UTX0 is ERC20 {
    constructor(string memory _name, string memory _symbol) ERC20(_name, _symbol) {}
}
