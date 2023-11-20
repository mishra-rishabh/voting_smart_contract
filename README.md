# Decentralized Voting System Smart Contract

### Overview
This smart contract implements a decentralized voting system with the following features:

* Supports multiple candidates
* Defines a voting duration
* Prevents duplicate voting
* Provides real-time vote count updates
* Allows users to view candidate information and remaining voting time

### Usage
**Deploying the Contract**
* Compile the contract using Solidity compiler.
* Deploy the contract to the Ethereum blockchain using a web3.js interface or a suitable deployment tool.

**Casting Votes**
* Connect to the deployed contract using a wallet or web3.js interface.
* Call the `castVote` function, specifying the index of the candidate you want to vote for.

**Viewing Vote Counts**
* Call the `getAllCandidatesVotes` function to retrieve an array of `Candidate` structs containing the current vote counts for all candidates.

**Checking Voting Status**
* Call the `getVotingStatus` function to determine whether the voting period is still active.

**Getting Remaining Voting Time**
* Call the `getRemainingTime` function to retrieve the remaining time in seconds before the voting period ends.

### Security Considerations
The contract employs the following security measures:

* Prevents duplicate voting by maintaining a mapping of voters who have already voted.
* Validates candidate indices to prevent voting for non-existent candidates.
* Restricts certain functions to the contract owner using a modifier.

### License
MIT License