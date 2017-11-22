pragma solidity ^0.4.17;

contract Owned {
  address owner;

  function Owned() public {
    owner = msg.sender;
  }

  modifier onlyowner() {
    if (msg.sender == owner) {
      _;
    }
  }
}

contract Mortal is Owned {
  function kill() public {
    if (msg.sender == owner)
      selfdestruct(owner);
  }
}
