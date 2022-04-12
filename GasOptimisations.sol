// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract GasOptimisations {
    uint public total;

    // OPTIMISED: result = 51236 gas
    // input array = [1, 3, 4, 7, 8, 13, 46, 77, 80, 99]
    function addIfEvenOrTheNumber7Optimised(uint[] calldata array) external {
        uint _total = total;
        uint length = array.length;
        for (uint i = 0; i < length; ++i) {
            uint index = array[i];
            if (index % 2 == 1 || index == 7) {
                _total += index;
            }
        }
        total = _total;
    }

    // ORIGINAL: result = 56653 gas
    // input array = [1, 3, 4, 7, 8, 13, 46, 77, 80, 99]
    function addIfEvenOrTheNumber7Original(uint[] memory array) external {
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