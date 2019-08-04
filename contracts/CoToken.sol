pragma solidity^0.5.0;


//import "github.com/OpenZeppelin/zeppelin-solidity/contracts/ownership/Ownable.sol";
//import "github.com/OpenZeppelin/zeppelin-solidity/contracts/token/ERC20/ERC20.sol";
//import "github.com/OpenZeppelin/zeppelin-solidity/contracts/token/ERC721/ERC721Metadata.sol";

import "openzeppelin-solidity/contracts/ownership/Ownable.sol";
import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
import "openzeppelin-solidity/contracts/token/ERC721/ERC721Metadata.sol";

contract CoToken is Ownable, ERC20 {

    uint256 public _buyPrice;
    uint256 public _tokenSupply = 0;
    uint256 public _sellPrice;

    function buyPrice(uint256 _buyTokens) public returns (uint){
    //function buyPrice(uint256 _tokenSupply) public {
        _buyPrice = ((5*(10**15))*(_buyTokens)*(_buyTokens)) + ((2*10**17)*(_buyTokens)); //Price is already in wei
        //_buyPrice = ((10**16)*(_tokenSupplyi)) + (2*10**17);
        //return(_buyPrice);

    }

    function sellPrice(uint256 _buyTokens) public {    
    //function sellPrice(uint256 _tokenSupply) public {
        _sellPrice = ((5*(10**15))*(_buyTokens)*(_buyTokens)) + ((2*10**17)*(_buyTokens)); //Price is already in wei
    }

    function mint(uint256 _n) public payable {

        require(msg.value == _buyPrice, "Amount does not correspond to the price");
        _mint(msg.sender, _n);
        _tokenSupply = _tokenSupply + _n;
    }

    function burn(uint256 _x) onlyOwner public payable {
        require(msg.value == _sellPrice, "Insufficient funds");
        _burn(msg.sender, _x);
        _tokenSupply = _tokenSupply - _x;

    }


    function destroy() public onlyOwner {
        selfdestruct(msg.sender);
    }

}
