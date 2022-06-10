import { ethers } from "hardhat";
import { expect } from "chai";

describe("Staking Token", function () {
  const tokenAdress = "";

  this.before(async function () {
    this.StakingToken = await ethers.getContractFactory("StakingToken");
  });

  this.beforeEach(async function () {
    this.stakingToken = await this.StakingToken.deploy();
    await this.stakingToken.deployed();

    it("Creates a new pool", async function () {
         expect(this.stakingToken.createStakingPool(tokenAdress))
        .to.equal(await this.PoolId)
    });
  });
});
