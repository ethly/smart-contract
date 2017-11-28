pragma solidity ^0.4.18;

import "./utils/Mortal.sol";

contract LinkStorage is Mortal{
  struct Link {
    string url;
    string label;
    string description;
    string hashtags;
    uint timestamp;
  }

  Link[] links;

  function addLink(
    string url,
    string label,
    string description,
    string hashtags
  ) external {
    links.push(Link(url, label, description, hashtags, now));
  }

  function getLinksCount() external view returns (uint count) {
    count = links.length;
  }

  function getLinkAt(uint index) external view returns (
    bool exists,
    string url,
    string label,
    string description,
    string hashtags,
    uint timestamp
  ) {
    exists = false;
    if (index < links.length) {
      Link memory link = links[index];

      exists = true;
      url = link.url;
      label = link.label;
      description = link.description;
      hashtags = link.hashtags;
      timestamp = link.timestamp;
    }
  }

  function () external payable {
    owner.transfer(msg.value);
  }
}
