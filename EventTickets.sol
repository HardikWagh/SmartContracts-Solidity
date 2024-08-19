// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract EventTickets{
    uint  numberOfTickets;
    uint  ticketPrice;
    uint  totalAmount;
    uint  startAt;
    uint  endAt;
    uint  timeRange;
    string  message= "Buy you first EVENT ticket";

    constructor(uint _ticketPrice){
        ticketPrice = _ticketPrice;
        startAt = block.timestamp;
        endAt = block.timestamp + 7 days;
        timeRange = (endAt - startAt)/60/60/24;
    }

    function buyTickcet(uint _value)public returns(uint ticketID){
        numberOfTickets ++;
        totalAmount += _value;
        ticketID = numberOfTickets;
    }
    function getamount()public view returns(uint){
        return totalAmount;
    }
}
