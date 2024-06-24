# ETH + AVAX PROOF: Intermediate EVM Course

This Solidity program is a simple "MyContract" contract program in solidity that demonstrates the error handling using require, assert and revert methods. The purpose of this program is to give a basic understanding about error handling and the logic building for more such contracts.

## Description

This program is a simple contract written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain. The contract has four functions "setStudentStatus", "setMarks", "getTotalMarks" and "CGPA" that allow to set the status of a student and then set marks for a student as well as get total marks if student has more than zero marks in all subjects. Lastly, to get CGPA if student has minimum of 120 marks. This program serves as a simple and straightforward introduction to error-handling, and can be used as a stepping stone for more complex projects in the future.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., MyToken.sol). Copy and paste the following code into the file:
```solidity
// SPDX-License-Identifier: MIT
pragma solidity >=0.8.9;

contract myContract{
    mapping (address => bool) Student;
    struct Marks{
        uint Maths;
        uint English;
        uint Science;
    } mapping(address => Marks) StudentMarks;
    
   
    modifier isStudent(address _stu) {
        require(Student[_stu]==true,"Only students are allowed!!");
        _;
    }

    function setStudentStatus(address _stu,bool _status) public {
        Student[_stu] = _status;
    }
    
    function setMarks(address _stu,uint _maths, uint _english, uint _science) public isStudent(_stu) {
        StudentMarks[_stu] = Marks(_maths, _english, _science);
    }

    function getTotalMarks(address _student) public view isStudent(_student) returns (uint) {
        Marks memory marks = StudentMarks[_student];
        if(marks.Maths ==0 || marks.English ==0 || marks.Science ==0){
            revert("You are not eligible");
        }
        return marks.Maths + marks.English + marks.Science;
    }
    
    function CGPA(address _student) public view isStudent(_student) returns (uint) {
        uint total = getTotalMarks(_student);
        assert(total > 120); 
        return total/30;
    }

   
}
```


To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.9" (or another compatible version), and then click on the "Compile MyToken.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "MyToken" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling the Mint or Burn function. Click on the "MyContract" contract in the left-hand sidebar, and then click on the "setStudentStatus" function. Then, enter the value and click on "setMarks". Finally, click on the "transact" button to execute the function and set the new value. Then, call "getTotalMarks" and "CGPA" methods to get the results.

## Authors

Contributors names and contact info
- [@Harshdeep Singh](https://github.com/Sudo-Harsh-learner)
