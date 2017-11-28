pragma solidity ^0.4.18;

import 'truffle/Assert.sol';
import 'truffle/DeployedAddresses.sol';
import '../contracts/LinkStorage.sol';

contract TestLinkStorageInMemory {
  string _url = "url";
  string _label = "label";
  string _description = "description";
  string _hashtag = "hashtag";

  function getLinkStorage() internal returns (LinkStorage) {
    return new LinkStorage();
  }

  function testLinkCanBeAdded() public {
    LinkStorage linkStorage = getLinkStorage();
    addLink(linkStorage);
  }

  function testLinkStorageCorrectSize() public {
    LinkStorage linkStorage = getLinkStorage();
    uint oldSize = linkStorage.getLinksCount();
    addLink(linkStorage);
    Assert.equal(
      linkStorage.getLinksCount(),
      oldSize + 1,
      "Exactly one link should be added"
    );
  }

  function testLinkCanBeGot() public {
    LinkStorage linkStorage = getLinkStorage();
    uint size = linkStorage.getLinksCount();
    addLink(linkStorage);
    checkLinkAdded(true, linkStorage, size);
    checkLinkAdded(false, linkStorage, size + 1);
  }

  function addLink(LinkStorage linkStorage) private {
    linkStorage.addLink(
      _url,
      _label,
      _description,
      _hashtag
    );
  }

  function checkLinkAdded(
    bool exists,
    LinkStorage linkStorage,
    uint position
  ) private {
    var (_exists, url, label, description, hashtag, timestamp) =
      linkStorage.getLinkAt(position);
    if (exists) {
      Assert.equal(_exists, exists, "Link was added");
      Assert.isAbove(timestamp, 0, "Timestamp is positive");
    } else {
      Assert.equal(_exists, exists, "Link was not added");
    }
  }
}
