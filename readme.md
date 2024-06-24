# ETH + AVAX PROOF: Types of functions

This Solidity program is a simple "myToken" contract program in solidity that demonstrates the token creation using ERC20 contract. The purpose of this program is to give a basic understanding about ERC20 tokens.

## Description

This program is a simple contract written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain. The contract has three functions "mint", "burn",  and "transferTo" that allow only owner to mint the token to a specific address and other user to either burn or transfer their tokens.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., MyToken.sol). Copy and paste the following code into the file:
```solidity
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
```


To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.9" (or another compatible version), and then click on the "Compile MyToken.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "myToken" contract from the dropdown menu, and then click on the "Deploy" button.

## Authors

Contributors names and contact info
- [@Harshdeep Singh](https://github.com/Sudo-Harsh-learner)
