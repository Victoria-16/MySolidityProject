// SPDX-License-Identifier: MIT
pragma solidity ^ 0.8.0;
// crowdfunding is used to raise money or fund for the needy
interface IERC20{
    function transfer(address, uint) external returns (bool);
 
    function transferFrom(address, address, uint) 
    external returns (bool);
}
 
contract CrowdFund {
    event Launch( // this is the campaign  to be creatd or want to launch
        uint id, // this is the id of the person creating the contract
        address indexed creator,
        uint goal,// this is the goal of the created contract
        uint32 startAt,
        uint32 endAt
    );
    event Cancel(uint id);
    event Pledge(uint indexed id, address indexed caller, uint amount);//the pledge here is the Token the sender will be sending
    event Unpledge(uint indexed id, address indexed caller, uint amount);// this when the the person that pledge wants to cancel their pledge
    event Claim(uint id); //this is to cash out what was pledged
    event Refund(uint id, address indexed caller, uint amount); // refund is the way of getting your money back incase of an execess money 
 
    struct Campaign {  // struct here will help us ca
        // Creator of campaign
        address creator;
        // Amount of tokens to raise
        uint goal;
        // Total amount pledged
        uint pledged;
        // Timestamp of start of campaign
        uint32 startAt;
        // Timestamp of end of campaign
        uint32 endAt;
        // True if goal was reached and creator has claimed the tokens.
        bool claimed;
    }
 
    IERC20 public immutable token;
    // Total count of campaigns created.
    // It is also used to generate id for new campaigns.
    uint public count;
    // Mapping from id to Campaign
    mapping(uint => Campaign) public campaigns;
    // Mapping from campaign id => pledger => amount pledged
    mapping(uint => mapping(address => uint)) public pledgedAmount;
 
    constructor(address _token) {
        token = IERC20(_token);
    }
 
    function launch(uint _goal, uint32 _startAt, uint32 _endAt) external {
        require(_startAt >= block.timestamp, "start at < now");
        require(_endAt >= _startAt, "end at < start at");
        require(_endAt <= block.timestamp + 90 days, "end at > max duration");
 
        count += 1;
        campaigns[count] = Campaign({
            creator: msg.sender,
            goal: _goal,
            pledged: 0,
            startAt: _startAt,
            endAt: _endAt,
            claimed: false
        });
 
        emit Launch(count, msg.sender, _goal, _startAt, _endAt);
    }
 
    function cancel(uint _id) external {
        Campaign memory campaign = campaigns[_id];
        require(campaign.creator == msg.sender, "not creator");
        require(block.timestamp < campaign.startAt, "started");
 
        delete campaigns[_id];
        emit Cancel(_id);
    }
 
    function pledge(uint _id, uint _amount) external {
        Campaign storage campaign = campaigns[_id];
        require(block.timestamp >= campaign.startAt, "not started");
        require(block.timestamp <= campaign.endAt, "ended");
 
        campaign.pledged += _amount;
        pledgedAmount[_id][msg.sender] += _amount;
        token.transferFrom(msg.sender, address(this), _amount);
 
        emit Pledge(_id, msg.sender, _amount);
    }
 
    function unpledge(uint _id, uint _amount) external {
        Campaign storage campaign = campaigns[_id];
        require(block.timestamp <= campaign.endAt, "ended");
 
        campaign.pledged -= _amount;
        pledgedAmount[_id][msg.sender] -= _amount;
        token.transfer(msg.sender, _amount);
 
        emit Unpledge(_id, msg.sender, _amount);
    }
 
    function claim(uint _id) external {
        Campaign storage campaign = campaigns[_id];
        require(campaign.creator == msg.sender, "not creator");
        require(block.timestamp > campaign.endAt, "not ended");
        require(campaign.pledged >= campaign.goal, "pledged < goal");
        require(!campaign.claimed, "claimed");
 
        campaign.claimed = true;
        token.transfer(campaign.creator, campaign.pledged);
 
        emit Claim(_id);
    }
 
    function refund(uint _id) external {
        Campaign memory campaign = campaigns[_id];
        require(block.timestamp > campaign.endAt, "not ended");
        require(campaign.pledged < campaign.goal, "pledged >= goal");
 
        uint bal = pledgedAmount[_id][msg.sender];
        pledgedAmount[_id][msg.sender] = 0;
        token.transfer(msg.sender, bal);
 
        emit Refund(_id, msg.sender, bal);
    }
}

