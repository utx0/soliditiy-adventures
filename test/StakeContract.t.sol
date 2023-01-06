pragma solidity ^0.8;

import "forge-std/Test.sol";
import "../src/StakeContract.sol";
import "../src/mocks/MockERC20.sol";

contract StakeContractTest is Test {
    StakeContract public stakeContract;
    MockERC20 public token;

    uint256 public constant AMOUNT = 1e18;

    function setUp() public {
        stakeContract = new StakeContract();
        token = new MockERC20("My token", "MT");
    }

    function testStakingTokens() public {
        token.approve(address(stakeContract), AMOUNT);
        assertEq(token.balanceOf(address(this)),1e18 * 1_000_000);
        bool success = stakeContract.stake(AMOUNT, address(token));
        assertTrue(success);
        assertEq(stakeContract.s_balances(address(this)),AMOUNT);
        assertEq(token.balanceOf(address(this)),1e18 * 1_000_000 - AMOUNT);
    }
}
