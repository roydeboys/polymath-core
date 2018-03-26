pragma solidity ^0.4.18;

import './CappedSTO.sol';
import '../../interfaces/IModuleFactory.sol';
import '../../interfaces/IModule.sol';

contract CappedSTOFactory is IModuleFactory {

  function deploy(bytes _data) external returns(address) {
      //polyToken.transferFrom(msg.sender, owner, getCost());

      //Check valid bytes - can only call module init function
      CappedSTO cappedSTO = new CappedSTO(msg.sender);
      //Checks that _data is valid (not calling anything it shouldn't)
      require(getSig(_data) == cappedSTO.getInitFunction());
      require(address(cappedSTO).call(_data));
      return address(cappedSTO);
  }

  function getCost() view external returns(uint256) {
      return 0;
  }

  function getType() view external returns(uint8) {
      return 3;
  }

  function getName() view external returns(bytes32) {
      return "CappedSTO";
  }

  function getDescription() view external returns(string) {
    return "Capped STO";
  }

  function getTitle() view external returns(string) {
    return "Capped STO";
  }


}