//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";
import "@chainlink/contracts/src/v0.8/ConfirmedOwner.sol";

/**
 * Request testnet LINK and ETH here: https://faucets.chain.link/
 * Find information on LINK Token Contracts and get the latest ETH and LINK faucets here: https://docs.chain.link/docs/link-token-contracts/
 */

contract OracleAPI is ChainlinkClient, ConfirmedOwner {
    using Chainlink for Chainlink.Request;

    bytes32 private jobId;
    uint256 private fee;

    // multiple params returned in a single oracle response
    uint256 public btc;
    uint256 public usd;
    uint256 public eur;

    event RequestMultipleFulfilled(
        bytes32 indexed requestId,
        uint256 btc,
        uint256 usd,
        uint256 eur,
        uint256 balance
    );

    event LinkBalance(uint256 balance, uint256 spend);

    // Chainlink Token Balance....
    uint256 public lastBalance;
    uint256 public lastSpend;

    /**
     * @notice Initialize the link token and target oracle
     * @dev The oracle address must be an Operator contract for multiword response
     *
     *
     * Sepolia Testnet details:
     * Link Token: 0x779877A7B0D9E8603169DdbD7836e478b4624789
     * Oracle: 0x6090149792dAAeE9D1D568c9f9a6F6B46AA29eFD (Chainlink DevRel)
     * jobId: 53f9755920cd451a8fe46f5087468395
     *
     *
     * Mumbai Testnet details:
     * Link Token: 0x326C977E6efc84E512bB9C30f76E30c160eD06FB
     * Oracle: 0x40193c8518BB267228Fc409a613bDbD8eC5a97b3 (Chainlink DevRel)
     * jobId: 53f9755920cd451a8fe46f5087468395
     *
     */
    constructor() ConfirmedOwner(msg.sender) {
        setChainlinkToken(0x326C977E6efc84E512bB9C30f76E30c160eD06FB);
        setChainlinkOracle(0x40193c8518BB267228Fc409a613bDbD8eC5a97b3);
        jobId = "53f9755920cd451a8fe46f5087468395";
        fee = (1 * LINK_DIVISIBILITY) / 10; // 0,1 * 10**18 (Varies by network and job)

        lastBalance = 0;
        lastSpend = 0;
    }

    /**
     * @notice Request mutiple parameters from the oracle in a single transaction
     */
    function requestMultipleParameters() public {
        require(lastBalance > 0, "Insufficient Link Balance!");

        Chainlink.Request memory req = buildChainlinkRequest(
            jobId,
            address(this),
            this.fulfillMultipleParameters.selector
        );
        req.add(
            "urlBTC",
            "https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=BTC"
        );
        req.add("pathBTC", "BTC");
        req.add(
            "urlUSD",
            "https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=USD"
        );
        req.add("pathUSD", "USD");
        req.add(
            "urlEUR",
            "https://min-api.cryptocompare.com/data/price?fsym=ETH&tsyms=EUR"
        );
        req.add("pathEUR", "EUR");
        sendChainlinkRequest(req, fee); // MWR API.

        lastBalanceOf();
    }

    /**
     * @notice Fulfillment function for multiple parameters in a single request
     * @dev This is called by the oracle. recordChainlinkFulfillment must be used.
     */
    function fulfillMultipleParameters(
        bytes32 requestId,
        uint256 btcResponse,
        uint256 usdResponse,
        uint256 eurResponse
    ) public recordChainlinkFulfillment(requestId) {
        emit RequestMultipleFulfilled(
            requestId,
            btcResponse,
            usdResponse,
            eurResponse,
            lastSpend
        );

        btc = btcResponse;
        usd = usdResponse;
        eur = eurResponse;
    }

    /**
     * Allow withdraw of Link tokens from the contract
     */
    function withdrawLink() public onlyOwner {
        LinkTokenInterface link = LinkTokenInterface(chainlinkTokenAddress());
        require(
            link.transfer(msg.sender, link.balanceOf(address(this))),
            "Unable to transfer"
        );
    }

    function lastBalanceOf() public returns (uint256, uint256) {
        bytes memory data = abi.encodeWithSignature(
            "balanceOf(address)",
            address(this)
        );
        (bool s, bytes memory r) = address(chainlinkTokenAddress()).call{
            gas: 0.01 ether
        }(data);

        require(s, "Unable to fetch balance from Chainlink!");

        uint256 response = abi.decode(r, (uint256));

        if (lastBalance > 0) {
            lastSpend = lastBalance - response;
        } else {
            lastSpend = response;
        }

        lastBalance = response;

        emit LinkBalance(lastBalance, lastSpend);

        return (lastBalance, lastSpend);
    }

    receive() external payable {
        lastBalanceOf();
    }
}
