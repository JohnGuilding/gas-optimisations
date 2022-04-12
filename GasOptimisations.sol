// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract GasOptimisations {
    // This contract is a demo of gas optimisations on a solidity function 
    // Tested in Remix

    // start -  gas
    // use calldata -  gas
    // load state variables to memory () -  gas
    // short circuit () -  gas
    // loop increments () -  gas
    // cache array length () -  gas
    // load array elements to memory () -  gas

    uint public total;

    // [1, 3, 4, 7, 8, 13, 46, 77, 80, 99]
    function multiplyIfOddAndTheNumber7Original(uint[] memory array) external {
        for (uint i = 0; i < array.length; i += 1) {
            bool isOdd = array[i] % 2 == 1;
            bool isNumber7 = array[i] == 7;

            if (isOdd && isNumber7) {
                total += array[i];
            }
        }
    }

    function getTotal() external view returns (uint) {
        return total;
    }
}