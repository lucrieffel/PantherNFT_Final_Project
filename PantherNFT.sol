// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "openzeppelin-contracts/contracts/access/Ownable.sol";
import "openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";
import "openzeppelin-contracts/contracts/token/ERC1155/ERC1155.sol";


contract PantherNFT is ERC1155, Ownable {
    uint256 public constant TOKEN_ID = 0;
    string public constant TOKEN_URI = "https://ipfs.io/ipfs/QmcNd58gbiV1pf6ChaPCDfRAZfGCuphRACpVDFtPiDtuFW?filename=pete_nft_image.jpeg";
    
    constructor() ERC1155(TOKEN_URI) {}

    function mint(address account, uint256 amount) public onlyOwner {
        _mint(account, TOKEN_ID, amount, "");
    }

    function burn(address account, uint256 amount) public {
        require(account == msg.sender, "You can only burn your own tokens");
        _burn(account, TOKEN_ID, amount);
    }
}