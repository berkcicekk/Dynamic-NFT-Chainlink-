// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.19;

/** 
 * @dev Berkelfreud
 */

contract Deoplama {
    string mesaj = "Selamss" ;

function mesajiGoruntule() public view returns(string memory) {
    return mesaj ;
} 

function mesajiDegis(string memory yeniMesaj) public{
    mesaj = yeniMesaj ;
} 

}
