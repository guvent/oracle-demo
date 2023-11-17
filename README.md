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


### Example results

#### Polygon - Chainlink (ETH/USDT)

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

#### Polygon - Witnet (BTC/USDT)

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


