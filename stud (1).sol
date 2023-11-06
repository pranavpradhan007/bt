// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentRegistry {
    struct Student {
        string name;
        uint256 age;
    }

    mapping(address => Student) public students;
    address[] public studentAddresses;

    event StudentAdded(address indexed studentAddress, string name, uint256 age);

    // Fallback function
    receive() external payable {
        revert("This contract does not accept Ether.");
    }

    function addStudent(string memory name, uint256 age) public {
        require(age > 0, "Age must be greater than 0");
        require(bytes(name).length > 0, "Name cannot be empty");

        students[msg.sender] = Student(name, age);
        studentAddresses.push(msg.sender);

        emit StudentAdded(msg.sender, name, age);
    }

    function getStudent() public view returns (string memory name, uint256 age) {
        require(bytes(students[msg.sender].name).length > 0, "Student not found");
        return (students[msg.sender].name, students[msg.sender].age);
    }

    function getTotalStudentCount() public view returns (uint256) {
        return studentAddresses.length;
    }
}