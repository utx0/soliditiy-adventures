pragma solidity ^0.8;

import "openzeppelin-contracts/contracts/token/ERC20/ERC20.sol";

contract MockERC20 is ERC20 {
    constructor(string memory _name, string memory _symbol) ERC20(_name, _symbol) {
        mint(msg.sender, 1e18 * 1_000_000);
    }

    function mint(address to, uint256 value) public {
        _mint(to, value);
    }
}
