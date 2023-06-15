// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract charitableorg {
    uint256 public threshold;//threshold to limit the fund
    uint256 public balance;//balance of the smart contract
    address[] public donors;// donors
    address[] public donatee;// donatee

    //trigger event
    event TransactionAlert(address account, uint256 amount, string alertMessage);
    
    //construct donateeList 
    struct donateeList{
        uint id;//define id
        string name; //define name
        uint mobile;//define mobile no
        string account;//define blockchain account
    }

    mapping(uint => donateeList) private donatees;
    uint[] private donateeIds; // store donatee account only

    //function to create donatee
    function createDonatee(uint _id,string memory _name, uint _mobile,string memory _account) public {
        donatees[_id] = donateeList(_id, _name, _mobile, _account);
        donateeIds.push(_id);
    }

    //Function to list all donatee
    function list() public view returns (uint[] memory){
        // return the array of donatees Ids
        return donateeIds;
    }

    constructor() {
        threshold = 0;
        balance = 0;
    }

    //this function is set threshold to limit funds
    //1000000000000000000 wei = 1 ether
    function setThreshold(uint256 _threshold) external {
        threshold = _threshold*1000000000000000000;
    }

    //this function is for donating funds
    function donate() external payable {
        require(msg.value > 0, "Donation amount must be greater than zero");//check funds donates with condition must be more than 0

        if (msg.value > threshold) {
            // trigger event that send report of huge transaction with their account and the amount of it
            emit TransactionAlert(msg.sender, msg.value, "Alert: Suspicious transaction detected!");
        }

        balance += msg.value; //balance of the smart contract 
        donors.push(msg.sender);

        //50000000000000000000 wei = 50 ether
        if (balance > 50000000000000000000) {
            // trigger event that send report if the balance of smart contract more than 50 ether
            emit TransactionAlert(address(this), balance, "Alert: Possible money laundering detected!");

            // Check all donors
            for (uint256 i = 0; i < donors.length; i++) {
                // trigger event that send report if the balance of smart contract more than 50 ether to the donors
                emit TransactionAlert(donors[i], 0, "Alert: Possible money laundering suspect (depositor)");
            }

            // Check all donatee
            for (uint256 i = 0; i < donatee.length; i++) {
                // trigger event that send report if the balance of smart contract more than 50 ether to the donatee
                emit TransactionAlert(donatee[i], 0, "Alert: Possible money laundering suspect (withdrawer)");
            }
        }

    }

    //1000000000000000000 wei = 1 ether
    //this function is for withdrawing funds
    function withdraw(address payable _to,uint256 amount) external  {
        // trigger event that send report if the balance of smart contract more than 50 ether to the donatee
        require(amount <= address(this).balance, "Insufficient contract balance");
        _to.transfer(amount*1000000000000000000);//transfer funds to the withdrawers account
        donatee.push(msg.sender);
    }

    //update balance
    function updateBalance(uint256 newBalance) external{
        balance = newBalance;
    }
}
