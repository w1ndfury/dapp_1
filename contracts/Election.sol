pragma solidity >=0.4.22 <0.8.0;

contract Election {
    // store candidate
    // read candidate
    string public candidate;
   
    // Constructor
    constructor() public {
        candidate = 'candidate A';
    }

    function setCandidate(string memory _newMessage) private{
        _newMessage ='candidate A';
        candidate = _newMessage;
    }

    function getCandidate() public view returns(string memory){
        return candidate;
    }
}
