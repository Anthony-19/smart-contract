pragma solidity ^0.8.0;

interface IERC20 {
    function transferFrom(address from, address to, uint amount) external returns (bool);
    function transfer(address to, uint amount) external returns (bool);
}

contract Vault {

    IERC20 public token;

    mapping(address => uint) public ethBalances;
    mapping(address => uint) public erc20Balances;

    constructor(address _token) {
        token = IERC20(_token);
    }

    // Deposit Ether
    function depositEther() external payable {
        require(msg.value > 0, "Send ETH");
        ethBalances[msg.sender] += msg.value;
    }

    // Withdraw Ether
    function withdrawEther(uint amount) external {
        require(ethBalances[msg.sender] >= amount, "Insufficient ETH");
        ethBalances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }

    // Deposit ERC20
    function depositERC20(uint amount) external {
        require(amount > 0, "Invalid amount");
        token.transferFrom(msg.sender, address(this), amount);
        erc20Balances[msg.sender] += amount;
    }

    // Withdraw ERC20
    function withdrawERC20(uint amount) external {
        require(erc20Balances[msg.sender] >= amount, "Insufficient token");
        erc20Balances[msg.sender] -= amount;
        token.transfer(msg.sender, amount);
    }
}
