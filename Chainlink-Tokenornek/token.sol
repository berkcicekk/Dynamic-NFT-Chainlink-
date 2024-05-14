// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

/** 
 * @dev Berkelfreud
 */


import "@openzeppelin/contracts@4.6.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.6.0/access/AccessControl.sol";

contract Token is ERC20, AccessControl {
    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    constructor() ERC20("Berkerium", "RBC") {
        _grantRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _grantRole(MINTER_ROLE, msg.sender);
    }

    function mint(address to, uint256 amount) public onlyRole(MINTER_ROLE) { // yeniden basılabilir + izin verilen hesaplarla
        _mint(to, amount);
    }

    function decimals() public pure override returns (uint8) {
        return 2;
    }    
}
