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
        // token approved to stake AMOUNT
        token.approve(address(stakeContract), AMOUNT);

        // Test balance of tokens before staking
        assertEq(token.balanceOf(address(this)), 1e18 * 1_000_000);

        // Stake AMOUNT of tokens
        bool success = stakeContract.stake(AMOUNT, address(token));
        assertTrue(success);

        // Test mapping balance of addresses with staked tokens in contract
        assertEq(stakeContract.s_balances(address(this)), AMOUNT);

        // Test balance of contract
        assertEq(token.balanceOf(address(stakeContract)), AMOUNT);

        // Test balance of tokens after the staking of tokens
        assertEq(token.balanceOf(address(this)), 1e18 * 1_000_000 - AMOUNT);
    }

    function testUnStakingTokens() public {
        // token approved to stake AMOUNT
        token.approve(address(stakeContract), AMOUNT);

        // Stake AMOUNT of tokens
        bool success = stakeContract.stake(AMOUNT, address(token));
        assertTrue(success);

        // Test balance of tokens before unstaking
        assertEq(token.balanceOf(address(this)), 1e18 * 1_000_000 - AMOUNT);

        // Unstake AMOUNT of tokens
        success = stakeContract.unStake(AMOUNT, address(token));
        assertTrue(success);

        // Test mapping balance of addresses with staked tokens in contract
        assertEq(stakeContract.s_balances(address(this)), 0);

        // Test balance of contract
        assertEq(token.balanceOf(address(stakeContract)), 0);

        // Test balance of tokens after the unstaking of tokens
        assertEq(token.balanceOf(address(this)), 1e18 * 1_000_000);
    }
}
