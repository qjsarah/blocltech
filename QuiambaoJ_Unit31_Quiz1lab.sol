// SPDX-License-Identifier: HAU
pragma solidity ^0.8.0;

contract ServiceFeeCalculator {
    struct Client {
        string firstName;
        string middleName;
        string lastName;
        uint256 serviceCode;
        uint256 totalFee;
        bytes32 uniqueHash;
    }

    Client client;

    constructor( string memory _firstName, string memory _middleName, string memory _lastName, uint256 _serviceCode) {
        uint256 fee = calculateFee(_serviceCode);

        bytes32 hashValue = keccak256(
            abi.encodePacked(_firstName, _middleName, _lastName, _serviceCode, fee)
        );

        client = Client({
            firstName: _firstName,
            middleName: _middleName,
            lastName: _lastName,
            serviceCode: _serviceCode,
            totalFee: fee,
            uniqueHash: hashValue
        });
    }

    function calculateFee(uint256 _serviceCode) internal pure returns (uint256) {
        if (_serviceCode == 1) {
            uint256 base = 10000;
            uint256 tax = (base * 12) / 100;
            return base + tax;
        } else if (_serviceCode == 2) {
            uint256 base = 2000;
            uint256 serviceCharge = (base * 10) / 100; 
            uint256 subtotal = base + serviceCharge; 
            uint256 tax = (subtotal * 12) / 100;
            return subtotal + tax;
        } else {
            revert("Invalid service code");
        }
    }

    function getClientDetails() public view returns (string memory, string memory, string memory, uint256, uint256, bytes32) {
        return (
            client.firstName,
            client.middleName,
            client.lastName,
            client.serviceCode,
            client.totalFee,
            client.uniqueHash
        );
    }
}
