import {
  time,
  loadFixture,
} from "@nomicfoundation/hardhat-toolbox-viem/network-helpers";
import { expect } from "chai";
import hre from "hardhat";

describe("Price", function () {
  // We define a fixture to reuse the same setup in every test.
  // We use loadFixture to run this setup once, snapshot that state,
  // and reset Hardhat Network to that snapshot in every test.
  async function deployFixture() {
    // Contracts are deployed using the first signer/account by default
    const [owner, otherAccount] = await hre.viem.getWalletClients();

    const price = await hre.viem.deployContract("Price", [], {});

    const publicClient = await hre.viem.getPublicClient();

    return {
      price,
      owner,
      otherAccount,
      publicClient,
    };
  }

  describe("Deployment", function () {
    it("Get Price Data", async function () {
      const { price, publicClient } = await loadFixture(deployFixture);

      const value = await price.write.getLatest();

      await new Promise((res) => {
        publicClient.watchContractEvent({
          address: price.address,
          abi: price.abi,
          onLogs: logs => res(logs),
          eventName: "Pending"
        });
      }).then(console.log);

      expect(value).to.not.equal(0);
    });
  });

});
