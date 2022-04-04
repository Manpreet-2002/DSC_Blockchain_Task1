// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.7.0 <0.9.0;

contract SimpleStorage {
    uint public noOfTranx; //Input total number of transactions
    uint result; //gives final result of percentage of total gas fees to the total value transacted 
    uint totalValueTransacted = 0;
    uint totalGasFees = 0;


    

    mapping(uint => Tranx) public tranx; //Made to make it easier to loop through to calculate total values of gas fees and transcations

    //Struct of transactions created

    struct Tranx{
        uint valueTransacted;
        uint gasFees;
    }
   

    function addTranx(uint _id, uint _valueTransacted, uint _gasFees) public{
        tranx[_id] = Tranx(_valueTransacted, _gasFees); //To input Tranx object
    }

    function setNoOfTranx(uint _noOfTranx) public{
        require(_noOfTranx != 0,'Number of transactions cannot be zero');
        noOfTranx = _noOfTranx; //To set number of transcations in tranx mapping
    }

    function calculateTotal() public{
        for(uint i = 0; i < noOfTranx; i++){
        totalValueTransacted = totalValueTransacted + tranx[i].valueTransacted; //To calculate total value transacted
        totalGasFees = totalGasFees + tranx[i].gasFees; ////To calculate total gas fees
        }
    }

    /*

    function add(uint x, uint y) public {
        result = x + y;
    }

    function sub(uint x, uint y) public {
        result = x - y;
    }

    function multiply(uint x, uint y) public {
        result = x * y;
    }

    function devide(uint x, uint y) public {
        require(y!=0,'Division by zero not possible');
        result = x / y;
    }
    */

    function percentages() public{
        uint temp;
        temp = totalGasFees * 100;
        result = temp / totalValueTransacted; //result will be in integer form expressed as percentage of total gas fees to total value transacted
    }
    
    function get() public view returns (uint) {
        return result; //get the value of result
    }

    
}