# Sample Hardhat Project

This project demonstrates a basic Hardhat use case. It comes with a sample contract, a test for that contract, and a script that deploys that contract.

Try running some of the following tasks:

```shell
npx hardhat help
npx hardhat test
REPORT_GAS=true npx hardhat test
npx hardhat node
npx hardhat run scripts/deploy.ts
```


## Example results
---

### Polygon - Chainlink (ETH/USDT)

[0x275FBf4C575182B10AB288e60Ca7665e260e57BA](https://mumbai.polygonscan.com/address/0x275FBf4C575182B10AB288e60Ca7665e260e57BA)

```
[
	{
		"from": "0x275fbf4c575182b10ab288e60ca7665e260e57ba",
		"topic": "0x72c356504280af33ea72035541fd25f02537e1aa8ee1bc4ecb04ec83561fe1cc",
		"event": "Pending",
		"args": {
			"0": "Pending...",
			"message": "Pending..."
		}
	},
	{
		"from": "0x275fbf4c575182b10ab288e60ca7665e260e57ba",
		"topic": "0x5401b7c5741abe39c80056e90e8181f7e35b209a6e1f94f0a12f727b3bafeba8",
		"event": "Answer",
		"args": {
			"0": "36893488147419306955",
			"1": "197885980000",
			"2": "1700211239",
			"3": "1700211239",
			"4": "36893488147419306955",
			"5": "1978",
			"roundId": "36893488147419306955",
			"answer": "197885980000",
			"startedAt": "1700211239",
			"updatedAt": "1700211239",
			"answeredInRound": "36893488147419306955",
			"value": "1978"
		}
	}
]
```

---
---

### Polygon - Witnet (BTC/USDT)

[0xeC8A3A2Cf1193e8196828C1809234fA2dADB4a3c](https://mumbai.polygonscan.com/address/0xeC8A3A2Cf1193e8196828C1809234fA2dADB4a3c)

```
[
	{
		"from": "0xec8a3a2cf1193e8196828c1809234fa2dadb4a3c",
		"topic": "0x72c356504280af33ea72035541fd25f02537e1aa8ee1bc4ecb04ec83561fe1cc",
		"event": "Pending",
		"args": {
			"0": "Pending...",
			"message": "Pending..."
		}
	},
	{
		"from": "0xec8a3a2cf1193e8196828c1809234fa2dadb4a3c",
		"topic": "0x0859185dffc5b0cbdade6c505badfec55edb2670cbb0a115a43398b1d5c3ea5d",
		"event": "Answer",
		"args": {
			"0": "1986300000",
			"1": "1700158770",
			"2": "200",
			"_value": "1986300000",
			"_timestamp": "1700158770",
			"_statusCode": "200"
		}
	}
]

```

---
---

### Polygon - OracleAPI

[0x7E3cF6bB6E5D026c131110B1BE36fe4D90925bB1](https://mumbai.polygonscan.com/address/0x7E3cF6bB6E5D026c131110B1BE36fe4D90925bB1)

---

### Before transfer link token from wallet to contract

Method: OracleAPI.lastBalanceOf()

Tx: 0xc64b85b246c0563dec19686ecaa05bbe1c8da616cee0abc5059f0ffc53d4beb2

```
[
	{
		"from": "0x7e3cf6bb6e5d026c131110b1be36fe4d90925bb1",
		"topic": "0x8d7e1031dd39a53d9f72c41357eaeaa57bc996943dd22dcb97894696c6b2b988",
		"event": "LinkBalance",
		"args": {
			"0": "0",
			"1": "0",
			"balance": "0",
			"spend": "0"
		}
	}
]
```

---

### After transfer link token from wallet to contract

Method: OracleAPI.lastBalanceOf()

Tx: 0xaa08667e1ec3e198de3e210c2e3b0a9cb239efb0ff46da6c00ecbea83f7eb356

```
[
	{
		"from": "0x7e3cf6bb6e5d026c131110b1be36fe4d90925bb1",
		"topic": "0x8d7e1031dd39a53d9f72c41357eaeaa57bc996943dd22dcb97894696c6b2b988",
		"event": "LinkBalance",
		"args": {
			"0": "2000000000000000000",
			"1": "2000000000000000000",
			"balance": "2000000000000000000",
			"spend": "2000000000000000000"
		}
	}
]
```

---

### Retrieve price data from oracle chainlink

Method: OracleAPI.requestMultipleParameters()

Tx: 0xca58cdcc1ea7bcd0b70d5c1b750c8ddaa0ced66089d1980e6ddbdcd9181da436

```
[
	{
		"from": "0x7e3cf6bb6e5d026c131110b1be36fe4d90925bb1",
		"topic": "0xb5e6e01e79f91267dc17b4e6314d5d4d03593d2ceee0fbb452b750bd70ea5af9",
		"event": "ChainlinkRequested",
		"args": {
			"0": "0x704d528d7c12a0bea38efca5e8a03bd428067fc27337da76d3d96cd01007033e",
			"id": "0x704d528d7c12a0bea38efca5e8a03bd428067fc27337da76d3d96cd01007033e"
		}
	},
	{
		"from": "0x7e3cf6bb6e5d026c131110b1be36fe4d90925bb1",
		"topic": "0x8d7e1031dd39a53d9f72c41357eaeaa57bc996943dd22dcb97894696c6b2b988",
		"event": "LinkBalance",
		"args": {
			"0": "1900000000000000000",
			"1": "100000000000000000",
			"balance": "1900000000000000000",
			"spend": "100000000000000000"
		}
	}
]
```

---
---

## Oracle API Instruction

### Guide Fund Your Contract [click here](https://docs.chain.link/resources/fund-your-contract)

1. In Remix, deploy your contract and wait until you see a new contract in the Deployed Contracts section.

2. On the left side panel, use the Copy button located near the contract title to copy the **contract address** to your clipboard.

3. In the Asset drop down menu, select the type of asset that you need to send to your contract. For example, you can send LINK.

4. Paste your contract address to the target address field in your wallet.

5. In the Amount field, enter the amount of LINK that you want to send.

6. Click Next to review the transaction details and click Confirm and wait for the transaction to process.


### If LINK is not listed, follow the guide to [Acquire testnet LINK](https://docs.chain.link/resources/acquire-link)

1. Open up MetaMask and click **Import tokens** at the bottom.

2. Find the LINK token contract address for the network that you want to use. See the LINK Token Contracts page to find the addresses for different testnets.
* Sepolia LINK token address: **0x779877A7B0D9E8603169DdbD7836e478b4624789**.
* Mumbai LINK token address: **0x326C977E6efc84E512bB9C30f76E30c160eD06FB**.

3. Paste the token contract address into MetaMask in the Token Address input. The token symbol and decimals of precision will auto-populate.

4. Click Next. A new window will appear, showing the LINK token details and Click Import Tokens to confirm adding the new token.

### Get Testnet Faucet [click here](https://faucets.chain.link/)

1. In Metamask, select the network where you want to receive testnet LINK.

2. Click Connect wallet so the faucet app can detect the network and wallet address.

3. In the Request type section, select the testnet funds that you want to receive.

4. Complete the Captcha and click Send request. The funds are transferred from the faucet to the wallet address that you specified.


After the transaction is confirmed on-chain, the faucet app shows "Request complete" and the transaction hash of your request.

---

Good luck :)

