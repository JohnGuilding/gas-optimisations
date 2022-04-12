    # This contract is a demo of gas optimisations on a solidity function 
    Tested in Remix

    ORIGINAL - 56653 gas
    - use calldata - 54004 gas
    - load state variables to memory - 52917 gas
    - short circuit (Moved bools inline) - 52333 gas
    - loop increments - 51653 gas
    - cache array length - 51586 gas
    - load array elements to memory - 51236 gas

    RESULT = 51236 gas
    A saving of 5417 gas

