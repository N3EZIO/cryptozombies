// SPDX-License-Identifier: MIT
pragma solidity ^0.8.6;

contract Token{
    string public name = "Money";
    string public symbol = "Welth";

    uint256 public decimals = 18;
    uint256 public totalSupply = 1000000000000000000000;

    mapping (address => uint256) public balanceOf;
    constructor(){
        balanceOf[msg.sender] = totalSupply;
    }

    event Trasnfer(address indexed from, address indexed to, uint256 value);


    function transfer(address _to ,uint256 _value) external returns (bool success){
        require(balanceOf[msg.sender] >= _value);
        balanceOf[msg.sender] = balanceOf[msg.sender] - (_value);
        balanceOf[_to] = balanceOf[_to] + _value;
        emit Trasnfer(msg.sender, _to, _value); 
        return true;
    }
}
