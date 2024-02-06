// SPDX-License-Identifier: MIT

//           ▄▄
//           ▀██▄    ██        ╔══
//   ▄▄▄▄▄▄▄▄  ▀██▄  ██        ║
//   ▀▀▀▀▀▀▀▀    ▀▀  ██           Octavia
//      ▄▄           ██   ▄▄      by Octavia Labs
//    ▄██▀              ▄██▀ 
//  ▄██▀              ▄██▀        The Superhuman AI Assistant
//  ▀▀  ▄▄            ▀▀          
//      ██                        octavia.one
//      ██   ▄▄   ████████        discord.gg/octavia
//      ██   ▀██▄              ║
//      ▀▀     ▀██▄            ╚══
//               ▀▀

pragma solidity =0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";

contract Octavia is ERC20, ERC20Permit, ERC20Votes {
    constructor() ERC20("Octavia", "VIA") ERC20Permit("Octavia") {
        _mint(msg.sender, 100000000 * 10 ** decimals());
    }

    // The following functions are overrides required by Solidity.

    function _update(address from, address to, uint256 value)
        internal
        override(ERC20, ERC20Votes)
    {
        super._update(from, to, value);
    }

    function nonces(address owner)
        public
        view
        override(ERC20Permit, Nonces)
        returns (uint256)
    {
        return super.nonces(owner);
    }
}