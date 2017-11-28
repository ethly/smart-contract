pragma solidity ^0.4.18;

import 'truffle/DeployedAddresses.sol';
import './TestLinkStorageInMemory.sol';
import '../contracts/LinkStorage.sol';

contract TestLinkStorageInBlockchain is TestLinkStorageInMemory {
  function getLinkStorage() internal returns (LinkStorage) {
    return LinkStorage(DeployedAddresses.LinkStorage());
  }
}
