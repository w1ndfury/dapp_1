pragma solidity >=0.4.22 <0.8.0;

contract Election {
    // Model a candidate
    struct Candidate{
        uint id;
        string name;
        uint voteCount;
    }
    // Store candidates
    // Fetch candidate
    mapping(uint => Candidate) public candidates;
    // Store candidates Count
    uint public candidatesCount;
   
    // Constructor
    constructor() public {
        addCandidate("candidate 1");
        addCandidate("candidate 2");
        addCandidate("candidate 3");
    }

    function addCandidate(string memory _name) private{
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }
}
