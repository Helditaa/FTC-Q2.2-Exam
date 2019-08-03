pragma solidity^0.5.0;

import "openzeppelin-solidity/contracts/ownership/Ownable.sol";
import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
//import "openzeppelin-solidity/contracts/token/ERC721/ERC721Metadata.sol";

contract CoToken is Ownable, ERC20 {

uint256 _price = 0;
uint256 _tokenSupply;
uint256 _sellPrice;

function buyPrice(uint256 _n) public {
    uint256 _price = (10**16)*(_n) + (2*10**17); //Price is already in wei

}

function mint(uint256 _price) public payable {

    require(msg.value == _price, "Amount does not correspond to the price");
    _mint(msg.sender, _price);
    // _tokenSupply ++;
}

function burn(uint256 _x) onlyOwner public payable {
    require(msg.value == _sellPrice, "Insufficient funds");
    
}

function sellPrice(uint256 _n) public {
    uint256 _price = (10**16)*(_n) + (2*10**17); //Price is already in wei
}



}
