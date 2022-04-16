// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract WAGMI {

    // We define a state variable 'message'
    string message;

    // We define another state variable to store the number of changes made;
    uint256 changesMade;

    // We define an Event to broadcast our state variable changed in the blockchain
    event ChangedMessage(uint256 changeOrder, string newMessage, string response);


    // A function to read the message stored in the contract
    function getMessage() public view returns(string memory) {
        return message;
    }

    // A function to read the number of changes made
    function getChangesMade() public view returns(uint256) {
        return changesMade;
    }


    // A function to modify the message stored in the contract
    function setMessage(string memory _msg) public {

        // We update the number of changes made
        changesMade++;

        // We store the message in the smart contract 'storage'
        message = _msg;

        // We define a variable to add a response in the Event
        string memory response = 'NGMI';

        // If the new message is 'gm', we change it to a fun response ;o)
        if (keccak256(abi.encodePacked(_msg)) == keccak256(abi.encodePacked('gm'))) {
            response = 'WAGMI';
        }

        // We launch the event notifying the change of our state variable
        emit ChangedMessage(changesMade, _msg, response);
    }
}
