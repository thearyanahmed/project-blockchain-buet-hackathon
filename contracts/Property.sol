pragma solidity 0.5.3;

contract Property {
    address private originalOwner;
    address private currentOwner;
    uint private value;
    address[] private ownerHistory;
    
    constructor(uint _value) public {
        originalOwner = msg.sender;
        currentOwner = originalOwner;
        value = _value;
    }
    
    function setOwner(address _currentOwner) public {
        currentOwner = _currentOwner;
        ownerHistory.push(_currentOwner);
    }
    
    function seeValue() public view returns(uint) {
        return value;
    }
    
    function getOriginalOwner() public view returns(address) {
        return originalOwner;
    }
    
    function getCurrentOwner() public view returns(address) {
        return currentOwner;
    }
    
    function getOwnerHistory() public view returns(address[] memory) {
        return ownerHistory;
    }
}
