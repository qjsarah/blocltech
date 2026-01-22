// SPDX-License-Identifier: HAU
pragma solidity ^0.8.0;

contract StringKeccakProcessor {

    string public submittedBy = "Quiambao, June Sarah";

    function processInputs(string[] memory flowers, string[] memory provinces, string memory year2026, string memory birthYear) public pure returns (
            string memory combinedString, bytes32 encodePackedHash, bytes32 encodeHash) {

        require(flowers.length == 5, "Must input exactly 5 flowers");
        require(provinces.length == 5, "Must input exactly 5 provinces");

        sortDescending(flowers);
        sortAscending(provinces);

        bytes1[12] memory chars;

        // Last character of flowers
        for (uint i = 0; i < 5; i++) {
            bytes memory f = bytes(flowers[i]);
            chars[i] = f[f.length - 1];
        }

        // First character of provinces
        for (uint i = 0; i < 5; i++) {
            chars[i + 5] = bytes(provinces[i])[0];
        }

        // Last digit of 2026
        bytes memory y = bytes(year2026);
        chars[10] = y[y.length - 1];

        // First digit of birth year
        chars[11] = bytes(birthYear)[0];

        combinedString = string(abi.encodePacked(chars));
        encodePackedHash = keccak256(abi.encodePacked(chars));
        encodeHash = keccak256(abi.encode(chars));
    }

    // ALPHABETICAL SORTINGS
    function isAlphabeticallyLess(
        string memory a,
        string memory b
    ) internal pure returns (bool) {
        bytes memory ba = bytes(a);
        bytes memory bb = bytes(b);

        uint minLength = ba.length < bb.length ? ba.length : bb.length;

        for (uint i = 0; i < minLength; i++) {
            if (ba[i] < bb[i]) return true;
            if (ba[i] > bb[i]) return false;
        }

        return ba.length < bb.length;
    }

    function sortAscending(string[] memory arr) internal pure {
        for (uint i = 0; i < arr.length; i++) {
            for (uint j = i + 1; j < arr.length; j++) {
                if (!isAlphabeticallyLess(arr[i], arr[j])) {
                    (arr[i], arr[j]) = (arr[j], arr[i]);
                }
            }
        }
    }

    function sortDescending(string[] memory arr) internal pure {
        for (uint i = 0; i < arr.length; i++) {
            for (uint j = i + 1; j < arr.length; j++) {
                if (isAlphabeticallyLess(arr[i], arr[j])) {
                    (arr[i], arr[j]) = (arr[j], arr[i]);
                }
            }
        }
    }
}   