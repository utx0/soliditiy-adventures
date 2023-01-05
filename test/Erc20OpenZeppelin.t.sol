pragma solidity ^0.8.0;

import "forge-std/Test.sol";
import "../src/Erc20OpenZeppelin.sol";

contract MyTokenTest is Test {
    MyToken public myToken;

    function setUp() public {
        myToken = new MyToken("utx0","utx0");
    }



}