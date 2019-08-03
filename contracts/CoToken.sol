pragma solidity^0.5.0;

import "openzeppelin-solidity/contracts/ownership/Ownable.sol";
import "openzeppelin-solidity/contracts/token/ERC20/ERC20.sol";
//import "openzeppelin-solidity/contracts/token/ERC721/ERC721Metadata.sol";

contract CoToken is Ownable, ERC20 {

    uint256 _buyPrice;
    uint256 _tokenSupply = 0;
    uint256 _sellPrice;

    function buyPrice(uint256 _tokenSupply) public {
        uint256 _buyPrice = (10**16)*(_tokenSupply) + (2*10**17); //Price is already in wei

    }

    function sellPrice(uint256 _tokenSupply) public {
        uint256 _sellPrice = (10**16)*(_tokenSupply) + (2*10**17); //Price is already in wei
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
