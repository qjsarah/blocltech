//SPDX-License-Identifier:HAU
pragma solidity ^0.8.8;
/*****************************
NAME: QUIAMBAO, JUNE SARAH P.
CODE AND SECTION: 2225-WD401
        LAB QUIZ 1
******************************/

contract Tuition {
    string public submittedBy = "June Sarah Quiambao";
    struct Student {
        string id; string name; 
        uint units; uint rate; uint labFee; uint miscFee;
    }
    mapping(address => Student) tuitionRecords;

    constructor(){
        tuitionRecords[0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db] = Student("Third Account","Juan Miguel", 24, 1050, 800, 1200);
        tuitionRecords[0x617F2E2fD72FD9D5503197092aC168c91465E7f2] = Student("Fifth Account","Thoo Miguel", 23, 1025, 1200, 1100 );
        tuitionRecords[0x0A098Eda01Ce92ff4A4CCb7A4fFFb5A43EBC70DC] = Student("Tenth Account","Thrice Miguel", 19, 1000, 1100, 900);
    }

    function displayAndCompute(address id) public view returns (string memory name, uint tuitionFee) {
        tuitionFee = (tuitionRecords[id].units * tuitionRecords[id].rate) + tuitionRecords[id].labFee + tuitionRecords[id].miscFee;
        return (
             tuitionRecords[id].name,
             tuitionFee
        );
    }

}