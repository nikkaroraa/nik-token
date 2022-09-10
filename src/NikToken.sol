// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import "./ERC20.sol";
import "./access/Ownable.sol";
import "./extensions/ERC20Burnable.sol";
import "./security/Pausable.sol";

contract NikToken is ERC20, Ownable, ERC20Burnable, Pausable {
    constructor() ERC20("NikToken", "NIK") {}

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function _beforeTokenTransfer(
        address from,
        address to,
        uint256 amount
    ) internal override whenNotPaused {
        super._beforeTokenTransfer(from, to, amount);
    }
}
