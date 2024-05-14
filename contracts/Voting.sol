// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;
 
/** 
 * @dev Berkelfreud
 */

contract RegisterAccess {
	string[] private info; // sadece sözleşme içinde erişilebilir
	address public owner; // sözleşme sahibi tutar
	mapping (address => bool) public allowlist; // izin takip
 
 // bool : 1 or 0 
 
	constructor() { // 1 kere calısır 
    	owner = msg.sender; 
    	allowlist[msg.sender] = true; 
	} 
 
	event InfoChange(string oldInfo, string newInfo); // event kontrat dısına haber verir
 
	modifier onlyOwner {
    	require(msg.sender == owner,"Sadece owner zort"); // require koşul dogru degılse eger
    	_;
	}
 
	modifier onlyAllowlist {
    	require(allowlist[msg.sender] == true, "Sadece ownerlar");
    	_;
	} 
 
	function getInfo(uint index) public view returns (string memory) {
    	return info[index];
	}
 
	function setInfo(uint index, string memory _info) public onlyAllowlist {
    	emit InfoChange (info[index], _info);
    	info[index] = _info;
	}
 
	function addInfo(string memory _info) public onlyAllowlist returns (uint index) {
    	info.push (_info);
    	index = info.length -1;
	}
   
	function listInfo() public view returns (string[] memory) {
    	return info;
	}
 
	function addMember (address _member) public onlyOwner {        
    	allowlist[_member] = true;
	}
 
	function delMember (address _member) public onlyOwner {
    	allowlist[_member] = false;
	}    
}