pragma solidity >=0.4.22 <0.8.0;

contract Election {
    // Model a candidate
    struct Candidate{
        uint id;
        string name;
        uint voteCount;
    }

    // Store accounts that have voted
    mapping(address => bool) public voters;

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

    // voted event
    event votedEvent (
        uint indexed _candidateId
    );

    // creates an transcaction, it costs gas
    function vote (uint _candidateId) public {
        // require that they haven't voted before
        require(!voters[msg.sender]);             // *** if require() returns FALSE then function stops execution and throw an exception

        // require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        // record that voter has voted
        voters[msg.sender] = true;

        // update candidate vote Count
        candidates[_candidateId].voteCount ++;

        // trigger voted event
        emit votedEvent(_candidateId);
    }

    
}
