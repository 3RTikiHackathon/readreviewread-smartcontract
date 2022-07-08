// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/token/ERC1155/extensions/ERC1155Supply.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract Certificate is Ownable, ERC1155Supply {
    
    string public baseUri;
    
    constructor(string memory _baseUri) ERC1155(_baseUri) {
        baseUri = _baseUri;
    }
    
    function mint(uint _tokenId) payable external {
        
        _mint(msg.sender, _tokenId, 1, "");

    }
    function uri(uint _tokenId) override public view returns (string memory){

        return (
            string(abi.encodePacked(baseUri, Strings.toHexString(_tokenId, 64), '.json'))
        );
    }

}