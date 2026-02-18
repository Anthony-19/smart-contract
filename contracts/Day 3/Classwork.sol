// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0

import {Erc} from "./Erc.sol";
import {SaveEther} from "./SaveEther.sol";

// write a smart contract that can save both erc20 and ether for a user. and users must be able to: check individual balances, deposit, withdraw or save in contract ether to other users.
// withdraw their savings.
contract ERC20 {
    string public name;
    string public symbol;
    uint public decimals = 18;
    uint public totalSupply;

    mapping(address => uint) public balanceOf;
    mapping(address ==> mapping(address => uint)) public allowance;

    constructor(string memory _name, string memory _symbol, uint _totalSupply) {
        name = _name;
        symbol = _symbol;
        totalSupply = _totalSupply * (10 ** decimals); 
    }
    function name() public view returns (string){
        return name;
    }
     function symbol() public view returns (string){
        return symbol;
    }
     function decimals() public view returns (uint256){
        return decimals;
    }
    function totalSupply() public view returns (uint256){
        return totalSupply;
    }
    function balanceOf(address _owner) public view returns (uint256 balance) {
        returns balanceOf[_owner];
    }

    function transfer(address _to, uint256 _value) public returns (bool success){
        require(_to != address(0), "The balance doesnt exist");
        require(_value < balanceOf[msg.sender], "Insufficient Balance");

        balanceOf[msg.sender] = balanceOf[msg.sender] - _value;
        balanceOf[_to] = balancesOf[_to] + _value
        return true;
    }
    function approve(address _spender, uint256 _value) public returns (bool success){
        require(_spender != address(0) && msg.sender = _spender, "The balance doesnt exist");
        require(_value < balanceOf[msg.sender], "Insufficient Balance");

        allowance[msg.sender][_spender] = _value; // This is where 
        return true;
    }
    function allowance(address _owner, address _spender) public view returns (uint256 remaining){
        return allowance[_owner][_spender];
    }

    function transferFrom(address _owner, address _to, uint256 _value) public returns (bool success) {
        require(_to != address(0) && _to != msg.sender && _to !=_owner, "The address doesnt work please input a correct address" );
        require(_value <= allowances[_owner][msg.sender]);
        allowances[_owner][msg.sender] -= _value;
        balances[_owner] -= _value;
        balances[_to] += _value;

        
    }
    function mint( address _to, uint256 _value) public returns(bool) {
        require(  _to != address(0))
        totalSupply += _value;
        balances[_to] += value;
    }
        
  
    event TransactionSuccessful(address indexed sender, uint indexed amount); // Next is you emit inside the function  
    event WithdrawalSuccessful(address indexed sender, uint indexed amount); 

    mapping(address => uint) public balances;
    
    function deposit() external payable{
       
        require(msg.sender != address(0), "Address zero detected");
        
        require(msg.value > 0, "Cant deposit zero value");
        
        balances[msg.sender] = balances[msg.sender] + msg.value;
        
        balances[msg.sender] += msg.value; 

        emit TransactionSuccessful(msg.sender, msg.value); 
        uint _age = this.viewOnce(); 
    }


function withdraw(uint _amount) external{
    require(msg.sender != address(0), "Address zero detected");
    // require(msg.value > 0, "Cant withdraw zero balance");
    uint256 userSavings_ = balances[msg.sender];

    require(userSavings_ > 0, "Insufficient funds");

    balances[msg.sender] = userSavings_ - _amount;

    
    (bool result,) = payable(msg.sender).call{value: _amount}(""); 
    require(result, "Transaction failed");
     
    emit WithdrawalSuccessful(msg.sender, _amount);
    
}

function getUserSavings() external view returns(uint){
    return balances[msg.sender]; 
}


function getContractBalance() external view returns(uint){
    return address(this).balance;
}

function viewOnce() external view returns(uint){
       
        return age;
    }


    receive() external payable {

        // This function is called when the contract receives ether without any data.  
        // When You send a transaction to a contract, it checks if the contract have a fall back function, it will revert
    }
    fallback() external {
        // This function is called when the contract receives ether with data or when no other function matches the call
    }

    mapping(address => uint) public ercBalances;
    mapping(address => uint) public ethBalances;
   
    function checkBalances() public view returns(uint, uint){
        return (ercBalances[msg.sender], ethBalances[msg.sender]);
    }

    function depositErc20(uint _amount) public payable{
        require(_amount > 0, "Amount must be greater than zero");
        require(ercBalances[msg.sender] >= _amount, "Insufficient ERC20 balance");
        
        ercBalances[msg.sender] += _amount;
    }
    function withdrawErc20(uint _amount) public {
        require(_amount > 0, "Amount must be greater than zero");
        require(ercBalances[msg.sender] >= _amount, "Insufficient ERC20 balance");
        
        ercBalances[msg.sender] -= _amount;
        (bool success,) = payable(msg.sender).call{value: _amount}("");
        require(success, "Withdrawal failed");
    }

    // We are going to create a
};

  // Fungible 
 