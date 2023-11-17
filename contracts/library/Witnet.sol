// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "witnet-solidity-bridge/contracts/interfaces/IWitnetPriceRouter.sol";

library Witnet {
    function getPrice(
        address _router
    )
        external
        view
        returns (int256 _value, uint256 _timestamp, uint256 _statusCode)
    {
        (_value, _timestamp, _statusCode) = IWitnetPriceRouter(_router)
            .valueFor(bytes4(0x3d15f701));
    }
}
