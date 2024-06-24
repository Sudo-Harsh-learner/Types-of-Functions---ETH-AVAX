// SPDX-License-Identifier: MIT
pragma solidity >=0.8.9;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/ERC20.sol";

contract myToken is ERC20{
    address private owner;
    constructor(string memory _name, string memory _symbol) ERC20(_name, _symbol){
        owner = msg.sender;
    }

    modifier onlyOwner{
        require(owner==msg.sender,"Only owner has access");
        _;
    }

    function mint(address _to,uint _val) public onlyOwner{
        _mint(_to,_val);
    }

    function burn(uint _val) public {
        _burn(msg.sender, _val);
    }

    function transferTo(address _to, uint _val) public  {
        _transfer(msg.sender, _to, _val);
    }
}
