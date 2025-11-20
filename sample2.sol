//SPDX-License-Identifier:HAU
pragma solidity ^0.8.8;
 
contract StudentGrades{
    struct Student {
        string name;
        string grade;
        string program;
    }

    mapping(address/*Accounts*/ => Student) public studentRecords;

    constructor() {
        studentRecords[0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2] = Student("June","99","WEB");
        studentRecords[0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db] = Student("Arcely","99","CS");
    }

    function setStudentData(address studentAddress, string memory name, string memory grade, string memory program) public {
        Student memory newStudent;
        newStudent.name = name;
        newStudent.grade = grade;
        newStudent.program = program;

        studentRecords[studentAddress] = newStudent;
    }
                            //argument: get student name from address    //format of return
    function getStudentName(address studentAddress) public view returns (string memory) {
        return studentRecords[studentAddress].name;
    }
    function getStudentGrade(address studentAddress) public view returns (string memory) {
        return studentRecords[studentAddress].grade;
    }
}