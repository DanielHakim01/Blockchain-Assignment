# Blockchain-Assignment


KULIYYAH OF INFORMATION AND COMMUNICATION TECHNOLOGY
CSCI 4312- BLOCKCHAIN AND APPLICATION
SEMESTER 2 2022/2023
PROJECT-PART 1
SECTION 02
MUHAMMAD DANIEL HAKIMBIN MOHD SUHAIMI 2018451
NIK AHMAD ZAHIN BIN NIK KAMAL 2015875
ABDUL RAZIQ ILHAM BIN ROSLI 2016297
TASK DISTRIBUTION
NAME
TASK
MUHAMMAD DANIEL HAKIM BIN MOHD SUHAIMI (2018451)
Creating the initial codes for the smart contract
Creating the base of the smart contract
Do some part of the report(elements of the code)
NIK AHMAD ZAHIN BIN NIK KAMAL (2015875)
Detecting errors in code and fixing it
Fulfill all the requirement needed in smart contract
Adding Comments to the coding 
Do some part of the report (3a and 3b Screenshot )
ABDUL RAZIQ ILHAM BIN ROSLI (2016297)
Presentation
Do some part of the report(1 and 2)


ELEMENTS OF THE CODE
Contract Structure:
The contract is named charitableorg. It starts with SPDX license identifier and specifies the Solidity version pragma (^0.8.0).
Variables:
threshold: Represents the threshold amount that limits the fund.
balance: Tracks the balance of the smart contract.
donors: An array to store the addresses of donors.
donatee: An array to store the addresses of donatees (withdrawers).
Events:
TransactionAlert: Triggered when specific conditions are met. It emits an event with the account address, transaction amount, and an alert message.
Struct: 
donateeList: Defines the structure for a donatee, containing an ID, name, mobile number, and account details.

Mappings:
donatees: Maps donatee IDs to their respective donateeList structures.
Arrays: 
donateeIds: Stores only the donatee account IDs for listing purposes.
Constructor: Initializes threshold and balance to zero.
Function createDonatee: Allows the creation of a donatee by providing their ID, name, mobile number, and account details. Adds the donatee to the donatees mapping and pushes the donatee ID to the donateeIds array.
Function list: Retrieves and returns an array of all donatee IDs.
Function setThreshold: Sets the threshold for limiting the funds of the contract. Multiplies the input _threshold by 1 ether (1 ether = 10^18 wei).
Function donate: Allows users to donate funds to the contract by sending a transaction with a value greater than zero. Checks if the donated amount is greater than the threshold. If so, it triggers a TransactionAlert event with an alert message. Adds the donated amount to the contract's balance. Records the donor's address in the donors array. If the balance exceeds 50 ether, it triggers multiple 
TransactionAlert events: One from the contract's address indicating possible money laundering.Individual alerts for each donor and donatee, suspecting them of money laundering.
Function withdraw: Allows the donatee (withdrawer) to withdraw funds from the contract. The amount to be withdrawn (amount) is specified as a parameter. Requires that the contract's balance is sufficient to cover the requested withdrawal amount. Transfers the specified amount (multiplied by 1 ether) to the specified address _to. Records the donatee's address in the donatee array.





SCREENSHOTS OF FULFILMENT OF REQUIREMENTS
1. There are sets of Actors (donatee, donor & charitable organization)



2. How this system works:
 i. The needy people would upload their data on the portal connected to the Blockchain system
 ii. The community can access their data from the Blockchain and would be able to help them directly and safely
iii. Implementation of this system would help in providing help to needy people and will ensure transparency in the transactions.



3. The charitable organization (ie NGO) will perform the following regulatory functions:
i. Set the Threshold value of fund transacted. Example of latest threshold value = 10 Ether.
(1000000000000000000 wei = 1 ether)


ii. A valid account holder may transact (donate/receive) any amount of funds into/from the smart contract.


iii. However, if the fund transacted is > the Threshold value set by the charitable organization:
a. An alert (i.e., message) must be raised to report such a huge transaction.
b. The alert must include the address of the Account involved and the amount involved.



b. At any time, after any successful transaction, if the balance of funds in the smart contract is more than 50 Ether, the charitable organization must also be alerted via an appropriate message that the smart contract may have been used as a place to launder cryptocurrency.
i. The charitable organization must be alerted of ALL the Account Holders which have deposited funds into the smart contract (in real life, these are suspects for money launderers).
ii. The charitable organization must be alerted of ALL the Account Holders which have withdrawn fund from the smart-contract (in real life these are also suspects for money launderers).





