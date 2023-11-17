// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

import "./library/Chainlink.sol";
import "./library/Witnet.sol";

contract Price {
    event Answer(
        uint80 roundId,
        int256 answer,
        uint256 startedAt,
        uint256 updatedAt,
        uint80 answeredInRound,
        int256 value
    );

    event Answer(int256 _value, uint256 _timestamp, uint256 _statusCode);

    event Pending(string message);

    constructor() {}

    function getChainlink() public returns (int) {
        emit Pending("Pending...");

        (
            uint80 roundId,
            int256 answer,
            uint256 startedAt,
            uint256 updatedAt,
            uint80 answeredInRound,
            int256 value
        ) = Chainlink.getLatestRound(
                0x0715A7794a1dc8e42615F059dD6e406A6594651A,
                1e8
            );

        emit Answer(
            roundId,
            answer,
            startedAt,
            updatedAt,
            answeredInRound,
            value
        );

        return 0;
    }

    function getWitnet()
        public
        returns (int256 _value, uint256 _timestamp, uint256 _statusCode)
    {
        emit Pending("Pending...");

        (_value, _timestamp, _statusCode) = Witnet.getPrice(
            0x9999999d139bdBFbF25923ba39F63bBFc7593400
        );

        emit Answer(_value, _timestamp, _statusCode);
    }
}
