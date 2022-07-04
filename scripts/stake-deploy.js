const ethers = "hardhat";

async function main() {
  const StakingToken = await ethers.getContractFactory("StakingToken");
  const stakingToken = await StakingToken.deploy("[CONTRACT ADDRESS]", 1);

  console.log("Deploying Staking Token....");
  // We get the contract to deploy
  await stakingToken.deployed();

  console.log("Deployed to:", stakingToken.address);
}

main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
