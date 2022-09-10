// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/NikToken.sol";

contract NikTokenTest is Test {
    NikToken public nikToken;

    function setUp() public {
        nikToken = new NikToken();
    }

    function testName() public {
        string memory name = nikToken.name();
        assertEq(name, "NikToken");
    }

    function testSymbol() public {
        string memory symbol = nikToken.symbol();
        assertEq(symbol, "NIK");
    }

    function testMint() public {
        uint256 mintSupply = 10e18;
        nikToken.mint(address(this), mintSupply);

        assertEq(nikToken.balanceOf(address(this)), mintSupply);
        assertEq(nikToken.totalSupply(), mintSupply);
    }
}
