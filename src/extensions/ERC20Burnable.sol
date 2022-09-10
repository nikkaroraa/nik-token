// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "../ERC20.sol";
import "../access/Ownable.sol";

abstract contract ERC20Burnable is ERC20, Ownable {
    function burn(uint256 amount) public virtual onlyOwner {
        _burn(msg.sender, amount);
    }
}
