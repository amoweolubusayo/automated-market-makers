require("@nomiclabs/hardhat-ethers");
require("@nomiclabs/hardhat-etherscan");
const { alchemyApiKey, mnemonic, etherScanKey } = require("./secrets.json");

module.exports = {
  networks: {
    goerli: {
      url: `https://eth-goerli.alchemyapi.io/v2/${alchemyApiKey}`,
      accounts: { mnemonic: mnemonic },
    },
  },
  etherscan: {
    apiKey: `${etherScanKey}`,
  },
  solidity: {
    compilers: [
      {
        version: "0.5.16",
      },
      {
        version: "0.6.2",
      },
      {
        version: "0.6.6",
      },
      {
        version: "0.8.0",
      },
      {
        version: "0.8.4",
        settings: {},
      },
    ],
    // version: ["0.8.4", "0.6.6", "0.6.2", "0.5.16"],
  },
};
