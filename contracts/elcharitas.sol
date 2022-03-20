//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract elcharitas {
    
    struct Timeline{
        uint Time;
        bytes32 Event;
    }

    struct ContactMe{
        uint256 timeSent;
        bytes32 purpose;
        bytes32 puposeTitle;
        uint256 phoneNumber;
        bytes32 email;
    }
    struct testimonials{
        bytes32 name;
        bytes32 testimony;
        uint256 time;
    }
    uint public contactMeCounter;
    uint public TimelineCounter;
    uint public  testimonialCounter;
    event ContactMeEvent(uint256 time,bytes32 email);
    mapping (uint=>Timeline) public Timelines;
    mapping (uint=>testimonials) public testimonial;
    mapping (uint=>ContactMe) public Contact;

    function donate() public payable{
    }
    function addTimeLine(uint _time,bytes32 _event )public {
        TimelineCounter++;
        Timelines[TimelineCounter]=Timeline(_time,_event);
    }
    function addTestimaonial(bytes32 _name,bytes32 _testimony)public {
         testimonialCounter++;
        testimonial[testimonialCounter]=testimonials(_name,_testimony,block.timestamp);
    }
    function contactMe(bytes32 _purpose,bytes32 _purposeTitle,uint256 _phone,bytes32 _email) public {
        contactMeCounter++;
        Contact[contactMeCounter]=ContactMe(block.timestamp,_purpose,_purposeTitle,_phone,_email);
        console.log(contactMeCounter++);
        emit ContactMeEvent(block.timestamp,_email);
    }

}
