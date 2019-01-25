
pragma solidity 0.5.3;

import "./Property.sol";

contract User
{
    enum PostStatus {POST_CREATED, LOAN_GIVEN, PROPERTY_RETURNED}
    
    // Common behaviors of all users
    address payable private account;
    Property[] private properties;

    // Borrower: Structure of a request
    struct Request {
        address payable borrowerAddress;
        address payable lenderAddress;
        uint amount;
        uint interestRate;
        uint numProperties;
        Property[] propertiesForMortgage;
        bool accepted;
    }
    
    // Lender: Structure of a post
    struct Post {
        address payable lenderAddress;
        uint amount;
        uint interestRate;
        uint numRequests;
        PostStatus status;
        mapping (uint => Request) requests;
        mapping (uint => Request) acceptedRequest;
    }
    
    // Lender: Post data
    uint private postCount;
    Post[] private postsGiven;
    Request[] private requestsMade;
    
    // Constructor of a user
    constructor() payable public {
        account = msg.sender;
        postCount = 0;
    }

    // Borrower: Adds new property
    function addProperty(uint _value) public {
        Property newProperty = new Property(_value);    
        properties.push(newProperty);
    }

    // Lender: Creates a new post
    function createPost(uint _lendAmount, uint _interestRate) public {
        require(_lendAmount <= account.balance); 
        postsGiven[postCount] = Post(account, _lendAmount, _interestRate, 0, PostStatus.POST_CREATED);
        postCount++;
    }

    
    // Borrower: Makes a request
    function makeRequest(Post storage _post, uint[] memory propertyNumbers, uint count) private {
        uint i;
        uint j;
        Property[] memory upForMortgage = new Property[](count);
        for(i = 0; i < count; i++) {
            j = propertyNumbers[i];
            upForMortgage[i] = properties[j];
        }
        
        for (i = 0; i < _post.numRequests; i++) {
            if (_post.requests[i].borrowerAddress == account) {
                break;
            }
        }
        
        if (i == _post.numRequests) {
            _post.requests[i] = Request(account, _post.lenderAddress, _post.amount, _post.interestRate, count,  upForMortgage, false);
            _post.numRequests++;
        }
    }


    // Lender: Accepts a request
    function acceptRequest(uint postNumber, uint requestNumber) private {
        Post storage _post = postsGiven[postNumber];
        Request storage _request = _post.requests[requestNumber];
        _request.accepted = true;
        uint i;
        for(i = 0; i < _request.numProperties; i++) {
            _request.propertiesForMortgage[i].setOwner(account);
        }
        _post.status = PostStatus.LOAN_GIVEN;
        _post.acceptedRequest[0] = _request;
        address payable selectedBorrower = _request.borrowerAddress;
        selectedBorrower.transfer(_post.amount);
    }

    // Borrower: Return the loan back
    function returnLoan(uint requestNumber) private {
        require(requestsMade[requestNumber].accepted);
        uint returnMoney = requestsMade[requestNumber].amount + ((requestsMade[requestNumber].amount * requestsMade[requestNumber].interestRate) / 100);
        
        require(returnMoney <= account.balance);
        
        requestsMade[requestNumber].lenderAddress.transfer(returnMoney);
        
        uint i;
        for(i = 0; i < requestsMade[requestNumber].numProperties; i++) {
            requestsMade[requestNumber].propertiesForMortgage[i].setOwner(account);
        }
    }

}