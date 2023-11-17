import hre from "hardhat";

async function main() {

  const price = await hre.viem.deployContract("Price", [], {});

  console.log(price.address, "deployed...");
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});


/*

Compiled 2 Solidity files successfully (evm target: paris).
0x10b4d4e6bb2eb91f54c26efed8695700da36aa43 deployed...

*/