// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title Basic Calculator
 * @dev A smart contract that performs basic arithmetic operations on-chain
 * @author Your Name
 */
contract Project {
    
    // State variable to store the last calculation result
    int256 public lastResult;
    
    // Event to emit when a calculation is performed
    event CalculationPerformed(string operation, int256 operand1, int256 operand2, int256 result);
    
    /**
     * @dev Performs basic arithmetic operations (add, subtract, multiply, divide)
     * @param _a First operand
     * @param _b Second operand
     * @param _operation Operation type: 1=add, 2=subtract, 3=multiply, 4=divide
     * @return result The result of the arithmetic operation
     */
    function calculate(int256 _a, int256 _b, uint8 _operation) public returns (int256 result) {
        require(_operation >= 1 && _operation <= 4, "Invalid operation. Use 1-4 for add/sub/mul/div");
        
        if (_operation == 1) {
            // Addition
            result = add(_a, _b);
            emit CalculationPerformed("Addition", _a, _b, result);
        } else if (_operation == 2) {
            // Subtraction
            result = subtract(_a, _b);
            emit CalculationPerformed("Subtraction", _a, _b, result);
        } else if (_operation == 3) {
            // Multiplication
            result = multiply(_a, _b);
            emit CalculationPerformed("Multiplication", _a, _b, result);
        } else if (_operation == 4) {
            // Division
            result = divide(_a, _b);
            emit CalculationPerformed("Division", _a, _b, result);
        }
        
        lastResult = result;
        return result;
    }
    
    /**
     * @dev Adds two integers
     * @param _a First number
     * @param _b Second number
     * @return The sum of _a and _b
     */
    function add(int256 _a, int256 _b) public pure returns (int256) {
        return _a + _b;
    }
    
    /**
     * @dev Subtracts two integers
     * @param _a First number
     * @param _b Second number
     * @return The difference of _a and _b
     */
    function subtract(int256 _a, int256 _b) public pure returns (int256) {
        return _a - _b;
    }
    
    /**
     * @dev Multiplies two integers
     * @param _a First number
     * @param _b Second number
     * @return The product of _a and _b
     */
    function multiply(int256 _a, int256 _b) public pure returns (int256) {
        return _a * _b;
    }
    
    /**
     * @dev Divides two integers
     * @param _a Dividend
     * @param _b Divisor
     * @return The quotient of _a divided by _b
     */
    function divide(int256 _a, int256 _b) public pure returns (int256) {
        require(_b != 0, "Division by zero is not allowed");
        return _a / _b;
    }
    
    /**
     * @dev Returns the last calculation result
     * @return The last stored result
     */
    function getLastResult() public view returns (int256) {
        return lastResult;
    }
    
    /**
     * @dev Resets the last result to zero
     */
    function resetCalculator() public {
        lastResult = 0;
        emit CalculationPerformed("Reset", 0, 0, 0);
    }
}
