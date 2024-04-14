// SPDX-License-Identifier: MIT
pragma solidity >=0.6.12 <0.9.0;

contract bank
 {
    address payable [] public user;
    address public manager;

    mapping(address=>uint) public OTPR;
    mapping(address=>uint) public OTPQ;
     mapping(address=>uint) MPINR;
     mapping(address=>uint) MPINQ;
    uint  public five;
    uint  public two;
    uint public one;
    uint public fifty;
    uint public otp1;
    uint public otp2;
    bool public condition;
    uint public pin1 = 3333; // declarer pin for user
    uint public pin2;
    uint public five_hundred_rs;
    uint public two_hundred_rs;
     uint public one_hundred_rs;
     uint public fifty_rs;
     uint public  total;
     mapping(address=>uint) user1;




    constructor ()
    {
        manager=msg.sender;
    }
    modifier owner() {
        require(msg.sender == manager, "You are not the manager");
        _;
    }
    //to seee AGAIN AND AGAIN

    function getOTP(uint v) public {
         OTPR[msg.sender]=v;
         otp1=v;
        // generate random otp and sent to user address
    }


    
    function receive_otp(uint r) public {
         OTPQ[msg.sender]=r;
         otp2=r;
          }



    function money_input( uint a, uint b, uint c, uint d) public  {
       require(otp1 == otp2, "wrong otp");
      // require();
                five = a;
                two = b;
                one = c;
                fifty = d;
                total=((five*500)+(two*200)+(one*100)+(fifty*50));
        if(otp1== otp2){
            condition =true;
        }
    }
        

     function withdraw_money() public view  returns(uint,uint,uint, uint, string memory){
        require(pin1 == pin2,"wrong PIN");
        require(five_hundred_rs> 0,"not enough 500 rs in machine");
        require(two_hundred_rs> 0,"not enough 200 rs in machine");
        require(one_hundred_rs> 0,"not enough 100 rs in machine");
        require(fifty_rs> 0,"not enough 50 rs in machine");
         string memory print = "Please Collect The Cash";
        return(five , two, one , fifty, print );
    
        
    }

    function get_PIN() public returns(uint){
        //use pin1 to store pin for particular user
    }

    
    
    function receive_PIN(uint q) public {
        require(condition == true);
        MPINQ[msg.sender]= q;
        pin2=q;
    }

    function left_money() public  returns(uint , uint , uint, uint){
        five_hundred_rs = 100 - five;
        two_hundred_rs = 100 - two;
        one_hundred_rs = 100- one;
        fifty_rs = 100 - fifty;
        return(five_hundred_rs, two_hundred_rs, one_hundred_rs, fifty_rs);
    }
    
    function rupee500() public view returns(uint){
        return(100-five);
    }

    function rupee200() public view returns(uint){
        return(100-two);
        
    }

    function rupee100() public view returns(uint){
        return(100-one);
        
    }
    function rupee50() public view returns(uint){
        return (100-fifty);
    }
     
     receive() external  payable {
        require(msg.value == 1 ether);
        user.push(payable(msg.sender));
    }

    function cash() public view returns(uint) {
        uint money;
        money=total;
        return money;
    }

    // function cash_receive() public payable {
    //     user1[msg.sender]=cash();
    //     user.transfer(cash());
    // } 
}