//SPDX-License-Identifier:HAU
pragma solidity ^0.8.8;

contract GlobalVariables{
    address public owner;

    constructor(){
        owner = msg.sender;
    } 

    function getOwner() public view returns (address /*format of the return*/) {
        return owner;
    }
    function isOwner(address _address) public view returns (bool /*format of the return*/) {
        return _address == owner;
    }
    function sendEther(address payable _recipient) public payable {
        require(msg.sender == owner, "Only the contract owner can send ether.");
        _recipient.transfer(msg.value);
    }
    function getCurrentBlock() public view returns (uint, uint, address /*format of the return*/) {
        return (block.number, block.timestamp, block.coinbase);
    }
}