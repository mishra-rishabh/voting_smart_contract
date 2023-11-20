// SPDX-License-Identifier: MIT
pragma solidity ^0.8.5;

contract VotingSystem {
    uint public votingStart;
    uint public votingEnd;

    struct Candidate {
        string name;
        uint voteCount;
    }

    Candidate[] public candidates;
    address owner;

    mapping(address => bool) public voters;

    constructor(string[] memory _candidateNames, uint _durationInMinutes) {
        for(uint16 i = 0; i < _candidateNames.length; i++) {
            candidates.push(
                Candidate({
                    name: _candidateNames[i],
                    voteCount: 0
                })
            );
        }

        owner = msg.sender;

        votingStart = block.timestamp;
        votingEnd = block.timestamp + (_durationInMinutes * 1 minutes);
    }

    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }

    function addCandidate(string memory _name) public onlyOwner {
        candidates.push(
            Candidate({
                name: _name,
                voteCount: 0
            })
        );
    }

    function castVote(uint _candidateIndex) public {
        require(!voters[msg.sender], "You have already casted a vote!");
        require(_candidateIndex < candidates.length, "Invalid candidate index!");

        candidates[_candidateIndex].voteCount++;
        voters[msg.sender] = true;

    }

    function getAllCandidatesVotes() public view returns (Candidate[] memory) {
        return candidates;
    }

    function getVotingStatus() public view returns (bool) {
        return (block.timestamp >= votingStart && block.timestamp < votingEnd);
    }

    function getRemainingTime() public view returns (uint) {
        require(block.timestamp >= votingStart, "Voting has not started!");

        if(block.timestamp >= votingEnd) {
            return 0;
        }

        return votingEnd - block.timestamp;
    }
}