// SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library Chainlink {
    function getLatestRound(
        address _networkId,
        int _scaleUp
    )
        external
        view
        returns (
            uint80 roundId,
            int256 answer,
            uint256 startedAt,
            uint256 updatedAt,
            uint80 answeredInRound,
            int256 value
        )
    {
        (
            roundId,
            answer,
            startedAt,
            updatedAt,
            answeredInRound
        ) = AggregatorV3Interface(_networkId).latestRoundData();

        if (_scaleUp > 0) {
            value = answer / _scaleUp;
        } else {
            value = answer;
        }
    }

    function getRound(
        address _networkId,
        int _scaleUp,
        uint80 _roundId
    )
        external
        view
        returns (
            uint80 roundId,
            int256 answer,
            uint256 startedAt,
            uint256 updatedAt,
            uint80 answeredInRound,
            int256 value
        )
    {
        (
            roundId,
            answer,
            startedAt,
            updatedAt,
            answeredInRound
        ) = AggregatorV3Interface(_networkId).getRoundData(_roundId);

        if (_scaleUp > 0) {
            value = answer / _scaleUp;
        } else {
            value = answer;
        }
    }
}
