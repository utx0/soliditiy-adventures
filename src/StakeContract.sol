pragma solidity ^0.8;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

error StakeContract__TransferFailed();

contract StakeContract {
    mapping(address => uint256) public s_balances;

    function stake(uint256 amount, address token) external returns (bool) {
        s_balances[msg.sender] = amount;

        bool success = IERC20(token).transferFrom(msg.sender, address(this), amount);
        if (!success) revert StakeContract__TransferFailed();
        return success;
    }

    function unStake(uint256 amount, address token) external returns (bool) {
        s_balances[msg.sender] -= amount;
        bool success = IERC20(token).transfer(msg.sender, amount);
        if (!success) revert StakeContract__TransferFailed();
        return success;
    }
}
