// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Lottery{
    //manager, players, and winner
    address public manager;
    address payable[] public players;
    address payable public winner;
    uint participationfee;
    uint award;

    constructor(){
        manager = msg.sender;
    }

    function participate() payable public{
        require(msg.value == 1 ether, "Please pay 1 ether only");
        players.push(payable (msg.sender));
    }

    function getbalance() public  view  returns(uint){
        require(msg.sender == manager, "You are not manager");
        return address(this).balance;
    }

    function random() internal view returns(uint){
        return (uint256(keccak256(abi.encodePacked(block.timestamp, block.prevrandao, players.length))));   
    }

    function pickWinner()public {
        require(msg.sender == manager, "You are not manager");
        require(players.length>=3, "Get more players");

        uint r = random();
        uint index = r%players.length;
        winner = players[index];
        winner.transfer(getbalance());
        players = new address payable[](0);

    }
}
