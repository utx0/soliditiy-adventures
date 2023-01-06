pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/mocks/MockUTX0ERC20.sol";

contract UTX0ContractTest is Test {
    MockUTX0ERC20 public token;

    function setUp() public {
        token = new MockUTX0ERC20();
        // Test tokens have minted correctly.
        assertEq(token.balanceOf(address(this)), 1e18 * 1_000_000);
    }
}
