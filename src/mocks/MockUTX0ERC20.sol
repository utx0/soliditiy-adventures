pragma solidity ^0.8;

import "../UTX0ERC20.sol";

contract MockUTX0ERC20 is UTX0 {
    constructor() UTX0("The utx0 token","UTX0") {
        _mint(msg.sender, 1e18 * 1_000_000);
    }
}