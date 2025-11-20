//SPDX-License-Identifier:HAU
pragma solidity ^0.8.8;
/***************************
NAME: Quiambao, June Sarah P.
COURSE CODE: 2225
DATE: November 20, 2025
***************************/

contract StudentProfile {
    struct StudentRecord {
        string Student_ID;
        string Fullname;
        string YearLevel;
        string Program;
        uint Average; //SOLIDITY DOES NOT SUPPORT DECIMALS/FLOATING POINTS
        string Remarks;        
    }
    
    mapping(address/*Accounts*/ => StudentRecord) studentInfo;

    constructor() {
        studentInfo[0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2] = StudentRecord("Second account","Kim Namjoon","2", "CS", 83, "Passed");
        studentInfo[0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db] = StudentRecord("Fifth account","Park Jimin","3", "WD", 92, "Passed");
        studentInfo[0x78731D3Ca6b7E34aC0F824c42a7cC18A495cabaB] = StudentRecord("Seventh account","Min Yoongi","4", "CYB", 85, "Passed");
        studentInfo[0x617F2E2fD72FD9D5503197092aC168c91465E7f2] = StudentRecord("Ninth account","Kim Seokjin","4", "CYB", 85, "Passed");

    }

    //input grades and compute average
    function computeAverage(address studentAddress, uint prelim, uint midterm, uint finals) public view returns (string memory Student_ID, uint Average, string memory Remarks) {
            uint ave = (prelim+midterm+finals)/3;
            if (ave<75) { 
                Remarks = "Failed";
            } else {Remarks = "Passed";}
        return ( 
            studentInfo[studentAddress].Student_ID,
            ave,
            Remarks
        );
    }

    //update student name, program, year level
    function updateStudentInfo(address studentAddress, string memory newFullname, string memory newYearLevel, string memory newProgram) public returns (string memory, string memory, string memory, string memory) {
        studentInfo[studentAddress].Fullname = newFullname;
        studentInfo[studentAddress].YearLevel = newYearLevel;
        studentInfo[studentAddress].Program = newProgram;

        return (studentInfo[studentAddress].Student_ID, newFullname, newYearLevel, newProgram);
    }
    //display
    function getStudentInfo(address studentAddress) public view returns (string memory, string memory, string memory, string memory) {
        StudentRecord memory student = studentInfo[studentAddress];
        return (student.Student_ID, student.Fullname, student.YearLevel, student.Program);
    }

    //display student profile
    function displayStudentProfile(address studentAddress) public view returns (string memory, string memory, string memory, string memory, uint, string memory) {
        return (
            studentInfo[studentAddress].Student_ID,
            studentInfo[studentAddress].Fullname,
            studentInfo[studentAddress].YearLevel,
            studentInfo[studentAddress].Program,
            studentInfo[studentAddress].Average,
            studentInfo[studentAddress].Remarks
        );
    }
}