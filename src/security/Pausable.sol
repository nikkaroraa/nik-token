// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Pausable {
    event Paused(address account);
    event Unpaused(address account);

    bool private _isPaused;

    constructor() {
        _isPaused = false;
    }

    modifier whenPaused() {
        _requirePaused();
        _;
    }

    modifier whenNotPaused() {
        _requireNotPaused();
        _;
    }

    function isPaused() public view virtual returns (bool) {
        return _isPaused;
    }

    function _requireNotPaused() internal view virtual {
        require(!isPaused(), "Pausable: paused");
    }

    function _requirePaused() internal view virtual {
        require(isPaused(), "Pausable: not paused");
    }

    function _pause() internal virtual whenNotPaused {
        _isPaused = true;
        emit Paused(msg.sender);
    }

    function _unpause() internal virtual whenPaused {
        _isPaused = false;
        emit Unpaused(msg.sender);
    }
}
